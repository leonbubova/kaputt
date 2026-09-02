# the newsletter goes out twice to some people
"Some addresses are in `subscribers` two or three times — the signup form just inserts. Clean it up and make sure it can't happen again." DB: `psql postgres://postgres:wg@localhost:5433/wg` (no psql? `docker exec -it wg-pg psql -U postgres -d wg`).
Goal: no duplicate emails, all 5 distinct subscribers kept, a second signup for an existing email is rejected by the database.
