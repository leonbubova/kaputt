# the order history page takes seconds
"`/customers/777/orders` went from instant to 2–3 s over the last months. Query is in `~/.k8s-wargame/postgres/query.sql` — the app team says it's trivial and won't change it." DB: `psql postgres://postgres:wg@localhost:5433/wg` (no psql? `docker exec -it wg-pg psql -U postgres -d wg`).
Goal: that query is fast (planner uses an index), no rows deleted, `query.sql` untouched.
