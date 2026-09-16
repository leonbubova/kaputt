source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
sqlf <<'SQL' >/dev/null
drop table if exists public.subscribers cascade;
create table public.subscribers (id serial primary key, email text not null, created_at timestamptz not null default now());
insert into public.subscribers (email, created_at) values
 ('ana@example.com',  '2026-03-01 10:00+00'), ('ben@example.com',  '2026-03-01 11:00+00'), ('ana@example.com',  '2026-03-02 09:00+00'),
 ('cleo@example.com', '2026-03-02 12:00+00'), ('ben@example.com',  '2026-03-03 08:00+00'), ('ben@example.com',  '2026-03-03 08:00+00'),
 ('dan@example.com',  '2026-03-04 14:00+00'), ('eve@example.com',  '2026-03-05 16:00+00');
SQL
