# finance wants a list: who ordered what
"One line per order: customer name and order total, biggest first. Put the query in `~/.k8s-wargame/postgres/query.sql` — we run it with psql." DB: `psql postgres://postgres:wg@localhost:5433/wg` (no psql? `docker exec -it wg-pg psql -U postgres -d wg`). Work = run SQL.
Goal: `query.sql` returns exactly two columns (`name`, `total`) from `customers` + `orders`, one row per order, ordered by total descending.
