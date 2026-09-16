source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
sql 'drop table if exists public.customers cascade' >/dev/null
