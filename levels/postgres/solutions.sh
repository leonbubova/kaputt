# machine-applied solutions, one function per level — used by run-all.sh only
source "${WG_ROOT:-$ROOT}/levels/postgres/lib.sh"
s01(){ sql "create table customers (id integer, name text, email text, created_at timestamptz)"; }
s02(){ sql "insert into products (name, price) values ('Keyboard', 49.90), ('Monitor', 199.00), ('Mouse', 19.90)"; }
s03(){ sql "alter table users add primary key (id), add unique (email), add check (age >= 18)"; }
s04(){ sql "delete from users where role = 'tester'"; }
s05(){ sql "delete from orders where customer_id not in (select id from customers); alter table orders add foreign key (customer_id) references customers (id)"; }
s06(){ sql "create index events_user_id_idx on events (user_id)"; }
s07(){ printf 'select c.name, o.total from orders o join customers c on c.id = o.customer_id order by o.total desc;\n' > "$QUERY"; }
s08(){ printf 'select c.name, count(*) as orders from orders o join customers c on c.id = o.customer_id group by c.id, c.name order by orders desc;\n' > "$QUERY"; }
s09(){ sql "create view customer_totals as select c.name, sum(o.total) as revenue from customers c join orders o on o.customer_id = c.id group by c.id, c.name"; }
s10(){ sql "create index orders_customer_id_idx on orders (customer_id)"; }
s11(){ sql "delete from orders where customer_id in (select id from customers where cancelled)"; }
s12(){ sql "delete from subscribers a using subscribers b where a.email = b.email and a.id > b.id; alter table subscribers add unique (email)"; }
s13(){ cat > "$WG_PG_DIR/seed.sql" <<'SQL'
-- demo data for the sales dashboard
begin;
insert into customers (id, name) values (1, 'Anna'), (2, 'Ben'), (3, 'Cara');
insert into orders (id, customer_id, total) values (1, 1, 100.00), (2, 1, 50.00), (3, 2, 20.00), (4, 3, 75.50);
commit;
SQL
sql -f - < "$WG_PG_DIR/seed.sql"; }
s14(){ sql "alter table products alter column price type numeric(10,2) using price::numeric"; }
s15(){ sql "alter table events alter column user_id type integer using user_id::integer"; }
s16(){ printf 'select id, coalesce(nickname, name) as display from customers order by id;\n' > "$QUERY"; }
s17(){ sql "create or replace view invoice_totals as select id, customer, amount - coalesce(discount, 0) as total from invoices"; }
s18(){ sql "select pg_terminate_backend(pid) from pg_stat_activity where application_name = 'office-laptop'"; }
s19(){ sql "select pg_terminate_backend(pid) from pg_stat_activity where application_name = 'batch-reconcile'"; }
s20(){ sql "grant select on sales to wg_reporter"; }
