source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/postgres/lib.sh"
sqlf <<'SQL' >/dev/null
select pg_terminate_backend(pid) from pg_stat_activity where datname = 'wg' and pid <> pg_backend_pid();
drop table if exists public.accounts cascade;
create table public.accounts (id serial primary key, owner text not null, balance numeric(12,2) not null);
insert into public.accounts (owner, balance) values ('Anna', 1000.00), ('Ben', 250.00), ('Cara', 4200.00);
SQL
# a forgotten session holds a row lock on account 1 inside an open transaction
docker exec -d -e PGAPPNAME=batch-reconcile "$PGC" psql -U postgres -d wg -X -q -c "begin; update accounts set balance = balance where id = 1; select pg_sleep(36000);" >/dev/null 2>&1
i=0; until [ "$(sql "select count(*) from pg_stat_activity where application_name = 'batch-reconcile' and state = 'idle in transaction' or (application_name = 'batch-reconcile' and state = 'active')")" -ge 1 ]; do sleep 0.5; i=$((i+1)); [ $i -gt 20 ] && break; done
sleep 1
