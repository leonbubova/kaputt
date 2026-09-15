source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
[ -s "$WG_PG_DIR/seed.sql" ] || fail "seed.sql is gone — fix it, don't delete it"
has_constraint orders f || fail "the foreign key on orders was removed — fix the script, not the schema"
[ "$(sql "select count(*) from customers")" = 3 ] || fail "customers not loaded (want 3)"
[ "$(sql "select count(*) from orders")" = 4 ] || fail "orders not loaded (want 4)"
# the file itself must apply to an empty copy of the schema
PGDB=postgres sql "drop database if exists wg_scratch with (force)" >/dev/null
PGDB=postgres sql "create database wg_scratch" >/dev/null
PGDB=wg_scratch sqlf <<'SQL' >/dev/null
create table public.customers (id integer primary key, name text not null);
create table public.orders (id integer primary key, customer_id integer not null references public.customers(id), total numeric(10,2) not null);
SQL
out=$(PGDB=wg_scratch sql -f - < "$WG_PG_DIR/seed.sql" 2>&1) || { PGDB=postgres sql "drop database wg_scratch with (force)" >/dev/null; fail "seed.sql still fails on an empty database:
$out"; }
PGDB=postgres sql "drop database wg_scratch with (force)" >/dev/null
ok "seed loads, orders reference customers"
