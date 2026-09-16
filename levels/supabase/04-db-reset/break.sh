source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
rm -f "$SB_PROJECT"/supabase/migrations/*.sql "$SB_PROJECT"/supabase/seed.sql
cat > "$SB_PROJECT/supabase/migrations/20240901100000_todos.sql" <<'SQL'
create table public.todos (id bigint generated always as identity primary key, title text not null);
SQL
sqlf < "$SB_PROJECT/supabase/migrations/20240901100000_todos.sql" >/dev/null
sql "create schema if not exists supabase_migrations; create table if not exists supabase_migrations.schema_migrations (version text not null primary key, statements text[], name text); insert into supabase_migrations.schema_migrations (version, name, statements) values ('20240901100000', 'todos', array['create table public.todos (id bigint generated always as identity primary key, title text not null)'])" >/dev/null
