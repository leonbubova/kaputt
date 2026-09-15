## 1
A query that "got slow over months" didn't change — the table grew. Without an index on the filter column postgres reads every row on every request, and that cost grows with the table. Prefix the query with `explain analyze` and read the plan: `Seq Scan on orders … rows=200000` — every request reads the whole table.
## 2
`\d orders` — the only index is the primary key. The filter is on `customer_id`. 200k rows × every page view.
## 3
`create index orders_customer_id_idx on orders (customer_id);` — `explain` now shows `Bitmap Index Scan` / `Index Scan`.
