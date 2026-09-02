source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
sqlf <<'SQL' >/dev/null
drop table if exists public.invoices cascade;
create table public.invoices (id serial primary key, customer text not null, amount numeric(10,2) not null, discount numeric(10,2));
insert into public.invoices (customer, amount, discount) values ('Anna', 120.00, 20.00), ('Ben', 80.00, null), ('Cara', 200.00, 0), ('Dan', 55.50, 5.50), ('Eve', 99.00, null);
create view public.invoice_totals as select id, customer, amount - discount as total from public.invoices;
SQL
