# remove the test accounts before launch
"`users` still has the QA accounts from the beta — every row with role `tester`. Get rid of them; the real users must stay untouched." DB: `psql postgres://postgres:wg@localhost:5433/wg` (no psql? `docker exec -it wg-pg psql -U postgres -d wg`). Work = run SQL.
Goal: no row with role `tester` left in `users`; the 4 real users are still there.
