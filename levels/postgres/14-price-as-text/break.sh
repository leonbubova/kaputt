source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
sqlf <<'SQL' >/dev/null
drop table if exists public.products cascade;
create table public.products (id serial primary key, name text not null, price text not null);
insert into public.products (name, price) values ('Keyboard', '49.90'), ('Monitor', '199.00'), ('Mouse', '19.90'), ('Cable', '5.00');
SQL
