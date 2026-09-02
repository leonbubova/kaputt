## 1
See how postgres runs the query: `explain select * from events where user_id = 42;` — `Seq Scan` means it reads all 100k rows.
## 2
An index on the filter column fixes that: `CREATE INDEX name ON table (column);`. `\d events` shows existing indexes.
## 3
`create index events_user_id_idx on events (user_id);` then run `explain` again — now `Index Scan` / `Bitmap Index Scan`.
