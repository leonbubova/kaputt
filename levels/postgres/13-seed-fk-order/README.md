# the demo seed script dies with a constraint error
"`~/.k8s-wargame/postgres/seed.sql` is supposed to fill the empty demo database. Running it aborts and nothing is loaded." DB: `psql postgres://postgres:wg@localhost:5433/wg` (no psql? `docker exec -it wg-pg psql -U postgres -d wg`).  Run it: `psql … -v ON_ERROR_STOP=1 -f seed.sql`.
Goal: `seed.sql` runs clean, `customers` has 3 rows and `orders` 4; the foreign key stays.
