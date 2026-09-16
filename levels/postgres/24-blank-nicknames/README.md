# the greeting mail has blank names
"The mailer runs `~/.k8s-wargame/postgres/query.sql`: one line per customer, `id` and the name to greet with — the nickname if they set one, otherwise the real name. Some lines come out with nothing after the id. Don't touch the data, marketing edits the nicknames." DB: `psql postgres://postgres:wg@localhost:5433/wg` (no psql? `docker exec -it wg-pg psql -U postgres -d wg`). Work = run SQL.
Goal: `query.sql` returns `id`, `display` for all 4 customers ordered by id, `display` never empty; `customers` unchanged.
