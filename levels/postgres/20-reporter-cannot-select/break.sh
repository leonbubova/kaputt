source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
PGDB=postgres sql "drop role if exists wg_reporter; create role wg_reporter login password 'wg'" >/dev/null
sqlf <<'SQL' >/dev/null
drop table if exists public.sales cascade;
create table public.sales (id serial primary key, region text not null, amount numeric(10,2) not null, sold_at date not null);
insert into public.sales (region, amount, sold_at) values ('north', 100, '2026-08-01'), ('south', 250, '2026-08-02'), ('north', 75, '2026-08-03'), ('east', 300, '2026-08-05'), ('west', 20, '2026-08-07');
SQL
