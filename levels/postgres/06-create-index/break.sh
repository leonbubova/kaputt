source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
sqlf <<'SQL' >/dev/null
drop table if exists public.events cascade;
create table public.events (id bigserial primary key, user_id integer not null, kind text not null, at timestamptz not null default now());
insert into public.events (user_id, kind, at) select (random()*3000)::int, (array['view','click','buy'])[1+(random()*2)::int], now() - (random()*86400*30) * interval '1 second' from generate_series(1, 100000);
analyze public.events;
SQL
