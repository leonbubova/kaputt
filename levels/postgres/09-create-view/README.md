# the dashboard needs a revenue-per-customer view
"BI tools can only read tables and views. Give them `customer_totals`: customer `name` and `revenue` (sum of their order totals)." DB: `psql postgres://postgres:wg@localhost:5433/wg` (no psql? `docker exec -it wg-pg psql -U postgres -d wg`). Work = run SQL.
Goal: view `customer_totals(name, revenue)` over `customers` + `orders`, one row per customer that has orders.
