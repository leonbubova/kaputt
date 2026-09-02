## 1
A view is a saved query: `CREATE VIEW name AS SELECT …;`. Afterwards `select * from name` works like a table.
## 2
Sum per customer = `SUM(o.total)` with `GROUP BY c.name` (or `c.id, c.name`) over the join of customers and orders. Name the sum `AS revenue`.
## 3
`create view customer_totals as select c.name, sum(o.total) as revenue from customers c join orders o on o.customer_id = c.id group by c.id, c.name;`
