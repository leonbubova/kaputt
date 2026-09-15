## 1
NULL means "unknown", not zero — and arithmetic with an unknown is unknown, so `amount - discount` is empty wherever `discount` was never filled in. Check: `select * from invoices where id in (2,5);` — `discount` is NULL there. `\d+ invoice_totals` shows the view does `amount - discount`.
## 2
Anything minus NULL is NULL — that's the empty total, and `sum()` silently skips those rows. Treat a missing discount as 0: `coalesce(discount, 0)`.
## 3
`create or replace view invoice_totals as select id, customer, amount - coalesce(discount, 0) as total from invoices;` (or `update invoices set discount = 0 where discount is null` and add `not null default 0`).
