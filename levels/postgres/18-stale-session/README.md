# disconnect the forgotten office session
"We rotate the DB password tonight. A psql from the office is still connected under application name `office-laptop` — end that connection. The API (`wg-api`) is connected too and must stay up." DB: `psql postgres://postgres:wg@localhost:5433/wg` (no psql? `docker exec -it wg-pg psql -U postgres -d wg`). Work = run SQL.
Goal: no session named `office-laptop` in the database; the `wg-api` session is still connected.
