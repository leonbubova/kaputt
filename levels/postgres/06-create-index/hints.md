## 1
Without an index on a column, the only way to find `user_id = 42` is to read every row — a Seq Scan. An index is a sorted lookup structure that jumps straight to the matching rows. See how postgres runs the query: `explain select * from events where user_id = 42;` — `Seq Scan` means it reads all 100k rows.
## 2
An index on the filter column fixes that: `CREATE INDEX name ON table (column);`. `\d events` shows existing indexes.
## 3
`create index events_user_id_idx on events (user_id);` then run `explain` again — now `Index Scan` / `Bitmap Index Scan`.
