## 1
Who is waiting on whom? `select pid, state, wait_event_type, application_name, left(query, 60) from pg_stat_activity where datname = 'wg';`
## 2
A session `idle in transaction` / running `pg_sleep` named `batch-reconcile` holds a row lock on `accounts` and will never commit. `select pg_blocking_pids(<waiting pid>)` confirms it.
## 3
`select pg_terminate_backend(pid) from pg_stat_activity where application_name = 'batch-reconcile';` — its transaction rolls back, the lock is released.
