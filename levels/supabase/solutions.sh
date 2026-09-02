# machine-applied solutions, one function per level — used by run-all.sh only
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"
SB_X="analytics,vector,imgproxy,pooler,edge-runtime"
s01(){ cat > "$SB_PROJECT/supabase/migrations/20240901100000_notes.sql" <<'SQL'
create table public.notes (id bigint generated always as identity primary key, body text not null, created_at timestamptz not null default now());
SQL
       (cd "$SB_PROJECT" && supabase migration up); }
s02(){ printf "insert into public.notes (body) values ('one'), ('two'), ('three');\n" > "$SB_PROJECT/supabase/seed.sql"; (cd "$SB_PROJECT" && supabase db reset); sb_wait_ready; sb_write_env; }
s03(){ sql 'create policy "public read" on public.notes for select to anon using (true)'; }
s04(){ sql "create function public.greet(name text) returns text language sql immutable as \$\$ select 'hello, ' || name \$\$"; }
s05(){ sql "insert into storage.buckets (id, name, public) values ('uploads', 'uploads', true)"; }
s06(){ sql 'alter policy "faq is public" on public.faq to anon, authenticated'; }
s07(){ sql 'alter policy "sign the book" on public.guestbook with check (true)'; }
s08(){ sql 'grant select on table public.products to anon, authenticated'; }
s09(){ sqlf <<'SQL'
create or replace function public.set_slug() returns trigger language plpgsql as $$
begin new.slug := lower(regexp_replace(trim(new.title), '[^a-zA-Z0-9]+', '-', 'g')); return new; end $$;
SQL
}
s10(){ sql 'drop trigger tasks_updated_at on public.tasks; create trigger tasks_updated_at before update on public.tasks for each row execute function public.set_updated_at()'; }
s11(){ sql 'alter view wg_analytics.top_articles set schema public'; }
s12(){ sql "update storage.buckets set public = true where id = 'avatars'"; }
s13(){ sql 'alter function public.event_count() security definer'; }
s14(){ sql 'alter publication supabase_realtime add table public.messages'; }
s15(){ cfg="$SB_PROJECT/supabase/config.toml"; sed -i.bak '/^\[auth.email\]/,/^\[/ s/^enable_confirmations = true/enable_confirmations = false/' "$cfg"; rm -f "$cfg.bak"
       (cd "$SB_PROJECT" && supabase stop && supabase start -x "$SB_X"); sb_wait_ready; sb_write_env; }
s16(){ sed -i.bak -e 's/NOT NUL unique/NOT NULL unique/' -e 's/(3, 2)/(2, 2)/' "$SB_PROJECT"/supabase/migrations/*_tags.sql; rm -f "$SB_PROJECT"/supabase/migrations/*.bak; (cd "$SB_PROJECT" && supabase db reset); sb_wait_ready; sb_write_env; }
s17(){ sql 'create index page_views_user_id_idx on public.page_views (user_id)'; }
s18(){ sql 'delete from public.subscribers a using public.subscribers b where a.email = b.email and a.id > b.id; alter table public.subscribers add constraint subscribers_email_key unique (email)'; }
