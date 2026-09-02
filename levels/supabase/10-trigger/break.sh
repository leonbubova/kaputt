source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
sqlf <<'SQL' >/dev/null
create table public.comments (id serial primary key, body text not null, word_count int, created_at timestamptz not null default now());
alter table public.comments enable row level security;
create policy "read" on public.comments for select to anon, authenticated using (true);
insert into public.comments (body, word_count) values ('first', 1), ('nice one', 2);
SQL
