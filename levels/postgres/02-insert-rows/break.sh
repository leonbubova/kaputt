source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
sqlf <<'SQL' >/dev/null
drop table if exists public.products cascade;
create table public.products (id serial primary key, name text not null, price numeric(10,2) not null);
SQL
