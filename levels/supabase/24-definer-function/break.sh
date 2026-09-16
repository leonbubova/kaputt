source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
sqlf <<'SQL' >/dev/null
create table public.orders (id serial primary key, total_cents int not null, created_at timestamptz default now());
alter table public.orders enable row level security;
insert into public.orders (total_cents) values (1200), (4500), (500), (9900);
SQL
