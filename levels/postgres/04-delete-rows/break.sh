source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
sqlf <<'SQL' >/dev/null
drop table if exists public.users cascade;
create table public.users (id serial primary key, email text not null, role text not null);
insert into public.users (email, role) values ('anna@example.com', 'member'), ('qa1@test.local', 'tester'), ('ben@example.com', 'admin'), ('qa2@test.local', 'tester'), ('cara@example.com', 'member'), ('qa3@test.local', 'tester'), ('dan@example.com', 'member');
SQL
