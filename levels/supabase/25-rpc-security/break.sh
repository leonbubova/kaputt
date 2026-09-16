source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
sqlf <<'SQL' >/dev/null
create table public.events (id serial primary key, kind text not null, user_id int, created_at timestamptz default now());
alter table public.events enable row level security;
insert into public.events (kind, user_id) values ('signup', 1), ('signup', 2), ('login', 1), ('purchase', 2), ('login', 3);
create or replace function public.event_count() returns bigint language sql stable as $fn$
  select count(*) from public.events
$fn$;
SQL
