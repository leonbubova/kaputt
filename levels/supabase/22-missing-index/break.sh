source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
sqlf <<'SQL' >/dev/null
create table public.page_views (id bigserial primary key, user_id int not null, path text not null, at timestamptz not null default now());
alter table public.page_views enable row level security;
create policy "read" on public.page_views for select to anon, authenticated using (true);
insert into public.page_views (user_id, path, at)
  select (random()*2000)::int, '/p/' || (random()*500)::int, now() - (random()*86400*30) * interval '1 second' from generate_series(1, 300000);
analyze public.page_views;
SQL
