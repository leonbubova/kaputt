# a table is named, typed columns: CREATE TABLE declares them once
Lesson: a relational database stores everything in tables. A table is a fixed set of columns, each with a name and a type; rows come later and every row has exactly those columns. You declare the shape once with `CREATE TABLE`.
The type is a contract: an `integer` column will never hold `'abc'`. Whole numbers → `integer`, free text → `text`, a point in time → `timestamptz` (short for `timestamp with time zone`).
You talk to postgres through `psql`. SQL statements end with `;`. Lines starting with `\` are psql meta-commands — they inspect, they don't change anything.
    create table t (a integer, b text);   declare a table with two typed columns
    \dt                                   list the tables in this database
    \d t                                  describe one table: columns and types
    drop table t;                         remove it again (only if you made a typo)
Try it first: `\dt` — the database is empty, so it says "Did not find any relations".
Your task: "The CRM is a blank database. First thing the app needs is a `customers` table." DB: `psql postgres://postgres:wg@localhost:5433/wg` (no psql? `docker exec -it wg-pg psql -U postgres -d wg`). Work = run SQL.
Goal: table `customers` with columns `id` (integer), `name` (text), `email` (text), `created_at` (timestamp with time zone).
Check yourself:  wg check      stuck?  wg hint
