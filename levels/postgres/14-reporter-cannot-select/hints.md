## 1
Reproduce as the role: `psql postgres://wg_reporter:wg@localhost:5433/wg -c 'select * from sales'`. `\dp sales` (as postgres) shows the access privileges — the column is empty.
## 2
A recreated table has no grants; the old ones died with the old table. Give exactly one privilege back: `GRANT SELECT ON table TO role`.
## 3
`grant select on sales to wg_reporter;` — nothing else. (For next time: `alter default privileges in schema public grant select on tables to wg_reporter;`)
