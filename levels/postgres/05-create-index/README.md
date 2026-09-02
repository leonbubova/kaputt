# an index makes WHERE on a column fast; EXPLAIN shows whether it is used
Lesson: without an index, answering `WHERE user_id = 42` means reading every row — a Sequential Scan. An index is a separate sorted structure on a column that lets postgres jump straight to the matching rows: an Index Scan.
Don't guess whether a query is fast; ask. `EXPLAIN` prints the plan without running the query. `Seq Scan on events` means the whole table; `Index Scan` or `Bitmap Index Scan using …` means it found an index for the filter. `EXPLAIN ANALYZE` also runs it and adds real timings.
Indexes cost write speed and disk: add them where queries filter or join. A primary key gets one automatically — only on the key column.
    explain select * from t where col = 1;      the plan: Seq Scan or Index Scan?
    create index t_col_idx on t (col);          build an index on col
    \di                                         list indexes
    \d t                                        the table's "Indexes:" block
Try it first: `explain select * from events where user_id = 42;` — read the first line of the plan.
Your task: "The feed does `select * from events where user_id = ?` — 100k rows, only a primary key. Give it an index before launch." DB: `psql postgres://postgres:wg@localhost:5433/wg` (no psql? `docker exec -it wg-pg psql -U postgres -d wg`). Work = run SQL.
Goal: an index on `events (user_id)`; `explain` of that query shows an index is used. No data deleted.
Check yourself:  wg check      stuck?  wg hint
