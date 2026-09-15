source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
sql "select pg_terminate_backend(pid) from pg_stat_activity where datname = 'wg' and pid <> pg_backend_pid()" >/dev/null
docker exec -d -e PGAPPNAME=office-laptop "$PGC" psql -U postgres -d wg -X -q -c "select pg_sleep(36000);" >/dev/null 2>&1
docker exec -d -e PGAPPNAME=wg-api "$PGC" psql -U postgres -d wg -X -q -c "select pg_sleep(36000);" >/dev/null 2>&1
i=0; until [ "$(sql "select count(*) from pg_stat_activity where application_name in ('office-laptop', 'wg-api')")" = 2 ]; do sleep 0.5; i=$((i+1)); [ $i -gt 20 ] && break; done
