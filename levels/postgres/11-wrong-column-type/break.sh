source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
sqlf <<'SQL' >/dev/null
drop table if exists public.events cascade;
create table public.events (id bigserial primary key, user_id text not null, kind text not null);
insert into public.events (user_id, kind) select ((random()*3000)::int + 10000)::text, 'view' from generate_series(1, 100000);
insert into public.events (user_id, kind) values ('4242', 'view'), ('4242', 'click'), ('4242', 'buy');
create index events_user_id_idx on public.events (user_id);
analyze public.events;
SQL
printf 'select count(*) from events where user_id = 4242;\n' > "$QUERY"
echo "$(md5 -q "$QUERY" 2>/dev/null || md5sum < "$QUERY" | cut -c1-32)" > "$WG_PG_DIR/.query.md5"
