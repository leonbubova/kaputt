source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
sqlf <<'SQL' >/dev/null
drop table if exists public.orders cascade; drop table if exists public.customers cascade;
create table public.customers (id serial primary key, name text not null);
insert into public.customers (name) values ('Anna'), ('Ben'), ('Cara');
create table public.orders (id serial primary key, customer_id integer not null references public.customers(id), total numeric(10,2) not null);
insert into public.orders (customer_id, total) values (1, 100.00), (3, 20.00), (1, 50.00), (2, 20.00), (3, 75.50), (1, 5.00);
SQL
rm -f "$QUERY"
