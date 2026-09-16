source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
sqlf <<'SQL' >/dev/null
create table public.rooms (id serial primary key, name text not null, created_at timestamptz default now());
alter table public.rooms enable row level security;
create policy "read" on public.rooms for select to anon, authenticated using (true);
insert into public.rooms (name) values ('general'), ('random');
SQL
