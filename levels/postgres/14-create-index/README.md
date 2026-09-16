# add an index for the activity feed
"The feed does `select * from events where user_id = ?` — 100k rows, only a primary key. Give it an index before launch." DB: `psql postgres://postgres:wg@localhost:5433/wg` (no psql? `docker exec -it wg-pg psql -U postgres -d wg`). Work = run SQL.
Goal: an index on `events (user_id)`; `explain` of that query shows an index is used. No data deleted.
