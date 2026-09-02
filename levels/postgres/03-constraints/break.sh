source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
sqlf <<'SQL' >/dev/null
drop table if exists public.users cascade;
create table public.users (id integer, email text, age integer);
insert into public.users values (1, 'anna@example.com', 34), (2, 'ben@example.com', 28), (3, 'cara@example.com', 41);
SQL
