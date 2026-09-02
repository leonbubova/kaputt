source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
sqlf <<'SQL' >/dev/null
drop table if exists public.orders cascade; drop table if exists public.customers cascade;
create table public.customers (id integer primary key, name text not null);
create table public.orders (id integer primary key, customer_id integer not null references public.customers(id), total numeric(10,2) not null);
SQL
cat > "$WG_PG_DIR/seed.sql" <<'SQL'
-- demo data for the sales dashboard
begin;
insert into orders (id, customer_id, total) values (1, 1, 100.00), (2, 1, 50.00), (3, 2, 20.00), (4, 3, 75.50);
insert into customers (id, name) values (1, 'Anna'), (2, 'Ben'), (3, 'Cara');
commit;
SQL
