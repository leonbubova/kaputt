# the app's user lookup crashes with an operator error
"Since the last import every request to the activity feed fails: `operator does not exist`. The query is in `~/.k8s-wargame/postgres/query.sql`; the release is frozen, the app is not changing." DB: `psql postgres://postgres:wg@localhost:5433/wg` (no psql? `docker exec -it wg-pg psql -U postgres -d wg`).
Goal: `query.sql` runs unchanged, returns the right count, and uses an index. No rows lost.
