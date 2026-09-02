# the BI tool gets 'permission denied for table sales'
"Reporting connects as `wg_reporter` (password `wg`) and only reads. Since the sales table was rebuilt last night, every dashboard is red." DB: `psql postgres://postgres:wg@localhost:5433/wg` (no psql? `docker exec -it wg-pg psql -U postgres -d wg`).  As the reporter: `psql postgres://wg_reporter:wg@localhost:5433/wg`.
Goal: `wg_reporter` can `select` from `sales` (5 rows) — and nothing more: no insert/update/delete.
