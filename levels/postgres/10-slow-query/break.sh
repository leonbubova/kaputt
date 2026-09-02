source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
sqlf <<'SQL' >/dev/null
drop table if exists public.orders cascade;
create table public.orders (id bigserial primary key, customer_id integer not null, total numeric(10,2) not null, placed_at timestamptz not null default now());
insert into public.orders (customer_id, total, placed_at) select (random()*5000)::int, round((random()*500)::numeric, 2), now() - (random()*86400*365) * interval '1 second' from generate_series(1, 200000);
analyze public.orders;
SQL
printf 'select id, total, placed_at from orders where customer_id = 777 order by placed_at desc;\n' > "$QUERY"
echo "$(md5 -q "$QUERY" 2>/dev/null || md5sum < "$QUERY" | cut -c1-32)" > "$WG_PG_DIR/.query.md5"
