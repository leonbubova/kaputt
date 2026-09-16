source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
pets_fixture
sql 'drop table if exists public.toys cascade' >/dev/null
