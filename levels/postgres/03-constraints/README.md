# users table accepts garbage
"`users` takes anything: two rows with the same id, the same email twice, an age of 7. Make the database refuse that." DB: `psql postgres://postgres:wg@localhost:5433/wg` (no psql? `docker exec -it wg-pg psql -U postgres -d wg`). Work = run SQL.
Goal: `users.id` is the PRIMARY KEY, `users.email` is UNIQUE, a CHECK constraint enforces `age >= 18`. The 3 existing rows stay.
