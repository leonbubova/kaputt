## 1
Every connection is a server process with a pid. `pg_stat_activity` lists them: `select pid, application_name, state from pg_stat_activity where datname = 'wg';`
## 2
A connection is ended by pid: `select pg_terminate_backend(<pid>);` — pick the one whose `application_name` is `office-laptop`, nothing else.
## 3
`select pg_terminate_backend(pid) from pg_stat_activity where application_name = 'office-laptop';` — run the pg_stat_activity query again: only `wg-api` (and you) remain.
