source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
sqlf <<'SQL' >/dev/null
create table public.rooms (id serial primary key, name text not null);
create table public.messages (id serial primary key, room_id int references public.rooms(id), body text not null, created_at timestamptz default now());
alter table public.rooms enable row level security;
alter table public.messages enable row level security;
create policy "read" on public.rooms for select to anon, authenticated using (true);
create policy "read" on public.messages for select to anon, authenticated using (true);
create policy "write" on public.messages for insert to anon, authenticated with check (true);
insert into public.rooms (name) values ('general'), ('random');
insert into public.messages (room_id, body) values (1, 'hi'), (1, 'anyone here?');
alter publication supabase_realtime add table public.rooms;
SQL
