# constraints are rules the database enforces on every write
Lesson: an application can forget to validate; the database can't. A constraint is a rule on a table that postgres checks on every INSERT and UPDATE, from any client. A row that breaks it is refused, nothing is written.
Three kinds cover most needs. PRIMARY KEY: the column identifies the row — unique, never null, one per table. UNIQUE: no two rows share this value (an email). CHECK: a condition every row must satisfy (`price > 0`).
Add one to an existing table with `ALTER TABLE … ADD`. Postgres first verifies the rows already there — if any violate it, the ALTER is refused.
    \d t                                         "Indexes:" and "Check constraints:" show what exists
    alter table t add primary key (id);          one row per id, never null
    alter table t add unique (col);              no duplicates in col
    alter table t add check (col >= 18);         every row must satisfy the condition
Try it first: `\d users` — no "Indexes:" block, no "Check constraints:" block: nothing is protected yet.
Your task: "`users` takes anything: two rows with the same id, the same email twice, an age of 7. Make the database refuse that." DB: `psql postgres://postgres:wg@localhost:5433/wg` (no psql? `docker exec -it wg-pg psql -U postgres -d wg`). Work = run SQL.
Goal: `users.id` is the PRIMARY KEY, `users.email` is UNIQUE, a CHECK constraint enforces `age >= 18`. The 3 existing rows stay.
Check yourself:  wg check      stuck?  wg hint
