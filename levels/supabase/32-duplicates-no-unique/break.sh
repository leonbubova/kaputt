source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
sqlf <<'SQL' >/dev/null
create table public.subscribers (id serial primary key, email text not null, created_at timestamptz not null default now());
alter table public.subscribers enable row level security;
create policy "subscribe" on public.subscribers for insert to anon, authenticated with check (true);
insert into public.subscribers (email, created_at) values
 ('ana@example.com',  '2024-03-01 10:00+00'),
 ('ben@example.com',  '2024-03-01 11:00+00'),
 ('ana@example.com',  '2024-03-02 09:00+00'),
 ('cleo@example.com', '2024-03-02 12:00+00'),
 ('ben@example.com',  '2024-03-03 08:00+00'),
 ('ben@example.com',  '2024-03-03 08:00+00'),
 ('dan@example.com',  '2024-03-04 14:00+00'),
 ('eve@example.com',  '2024-03-05 16:00+00');
SQL
