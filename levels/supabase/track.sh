# track: local supabase stack (supabase CLI + docker)
source "$WG_ROOT/levels/supabase/lib.sh"

sb_install_cli() {
  command -v supabase >/dev/null 2>&1 && return 0
  echo "installing supabase CLI…"
  case "$(uname -s)" in
    Darwin) brew install supabase/tap/supabase ;;
    Linux)
      local v arch tmp; v=$(curl -fsSL https://api.github.com/repos/supabase/cli/releases/latest | grep -o '"tag_name": *"[^"]*"' | cut -d'"' -f4)
      arch=$(uname -m); case "$arch" in x86_64) arch=amd64;; aarch64) arch=arm64;; esac
      tmp=$(mktemp -d)
      if command -v dpkg >/dev/null 2>&1; then
        curl -fsSL -o "$tmp/supabase.deb" "https://github.com/supabase/cli/releases/download/$v/supabase_${v#v}_linux_${arch}.deb" && sudo dpkg -i "$tmp/supabase.deb"
      else
        curl -fsSL "https://github.com/supabase/cli/releases/download/$v/supabase_linux_${arch}.tar.gz" | tar xz -C "$tmp" && sudo install -m755 "$tmp/supabase" /usr/local/bin/supabase
      fi ;;
    *) echo "install the supabase CLI manually: https://supabase.com/docs/guides/cli" >&2; return 1 ;;
  esac
}

track_start() {
  command -v docker >/dev/null 2>&1 || { echo "docker missing" >&2; return 1; }
  sb_install_cli || return 1
  mkdir -p "$SB_PROJECT"
  [ -f "$SB_PROJECT/supabase/config.toml" ] || (cd "$SB_PROJECT" && supabase init --yes >/dev/null 2>&1 || supabase init >/dev/null)
  mkdir -p "$SB_PROJECT/supabase/migrations"
  [ -f "$SB_DIR/config.toml.orig" ] || cp "$SB_PROJECT/supabase/config.toml" "$SB_DIR/config.toml.orig"
  if track_ready; then echo "stack running"; else
    echo "starting supabase stack (first run pulls ~2 GB of images)…"
    (cd "$SB_PROJECT" && supabase start -x analytics,vector,imgproxy,pooler,edge-runtime >/dev/null) || return 1
  fi
  sb_write_env; sb_env
  echo "API  $API_URL   studio http://127.0.0.1:54323"
  echo "env  $SB_ENV  (API_URL, ANON_KEY, SERVICE_ROLE_KEY, DB_URL)"
  command -v psql >/dev/null 2>&1 || echo "no psql on host — use: docker exec -it $SB_DBC psql -U postgres"
}
track_stop() { (cd "$SB_PROJECT" && supabase stop --no-backup); rm -f "$SB_ENV"; }
track_ready() {
  [ -d "$SB_PROJECT/supabase" ] || return 1
  docker inspect -f '{{.State.Running}}' "$SB_DBC" 2>/dev/null | grep -q true || return 1
  curl -sf -m 5 -o /dev/null http://127.0.0.1:54321/auth/v1/health 2>/dev/null
}
track_wipe() {  # before each level: empty schema public, storage, auth users, migrations
  sb_wait_ready || { echo "supabase not ready (storage tables missing) — wg start" >&2; return 1; }
  sb_write_env
  rm -f "$SB_PROJECT"/supabase/migrations/*.sql "$SB_PROJECT"/supabase/seed.sql
  sqlf <<'SQL' >/dev/null
set client_min_messages = warning;
do $$ declare r record; begin
  for r in select format('drop table if exists %I.%I cascade', schemaname, tablename) s from pg_tables where schemaname='public' loop execute r.s; end loop;
  for r in select format('drop view if exists %I.%I cascade', schemaname, viewname) s from pg_views where schemaname='public' loop execute r.s; end loop;
  for r in select format('drop materialized view if exists %I.%I cascade', schemaname, matviewname) s from pg_matviews where schemaname='public' loop execute r.s; end loop;
  for r in select format('drop function if exists %s cascade', p.oid::regprocedure) s from pg_proc p where p.pronamespace='public'::regnamespace and p.prokind in ('f','p') loop execute r.s; end loop;
  for r in select format('drop sequence if exists public.%I cascade', relname) s from pg_class where relnamespace='public'::regnamespace and relkind='S' loop execute r.s; end loop;
  for r in select format('drop type if exists public.%I cascade', typname) s from pg_type t where typnamespace='public'::regnamespace and typtype in ('e','c','d') and not exists (select 1 from pg_class c where c.reltype=t.oid and c.relkind<>'c') loop execute r.s; end loop;
  for r in select nspname from pg_namespace where nspname like 'wg_%' loop execute format('drop schema if exists %I cascade', r.nspname); end loop;
end $$;
do $$ begin
  if to_regclass('storage.objects') is not null then
    perform set_config('storage.allow_delete_query','true',true);
    delete from storage.objects; delete from storage.buckets;
  end if;
end $$;
delete from auth.users;
do $$ begin if to_regclass('supabase_migrations.schema_migrations') is not null then delete from supabase_migrations.schema_migrations; end if; end $$;
SQL
}
track_shell() { docker exec -it "$SB_DBC" psql -U postgres; }
