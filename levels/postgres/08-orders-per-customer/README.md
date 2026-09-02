# sales wants order counts per customer
"One line per customer: name and how many orders they placed, most orders first. Put the query in `~/.k8s-wargame/postgres/query.sql` — we run it with psql." DB: `psql postgres://postgres:wg@localhost:5433/wg` (no psql? `docker exec -it wg-pg psql -U postgres -d wg`). Work = run SQL.
Goal: `query.sql` returns exactly two columns (`name`, `orders`) from `customers` + `orders`, one row per customer that has orders, ordered by the count descending.
