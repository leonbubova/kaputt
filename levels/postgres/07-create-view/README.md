# GROUP BY collapses rows into one per group; a VIEW saves a query under a name
Lesson: a JOIN gives one row per order. One row per customer with a sum is aggregation. `GROUP BY c.name` folds all rows with the same name into one group, and an aggregate function like `SUM(o.total)` computes one value per group. Rule: every SELECT column is either in the GROUP BY or inside an aggregate. `AS x` names the computed column.
A VIEW is a query stored in the database under a table-like name: `CREATE VIEW v AS SELECT …`. `select * from v` runs the stored query fresh each time — no copy, always current. Anything that can read a table can read a view, which is how you hand a shaped result to dashboards.
    select c.name, sum(o.total) as revenue from … group by c.name;   one row per name, with a sum
    create view v as select …;                                       store the query as v
    select * from v;                                                  use it like a table
    \dv                                                               list views
Try it first: `select customer_id, count(*) from orders group by customer_id;` — orders per customer, one row each.
Your task: "BI tools can only read tables and views. Give them `customer_totals`: customer `name` and `revenue` (sum of their order totals)." DB: `psql postgres://postgres:wg@localhost:5433/wg` (no psql? `docker exec -it wg-pg psql -U postgres -d wg`). Work = run SQL.
Goal: view `customer_totals(name, revenue)` over `customers` + `orders`, one row per customer that has orders.
Check yourself:  wg check      stuck?  wg hint
