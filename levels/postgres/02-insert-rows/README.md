# INSERT names the columns you supply; serial columns fill themselves
Lesson: rows go into a table with `INSERT INTO table (columns) VALUES (…)`. List the columns you provide, then one value per column in the same order. Text goes in single quotes, numbers bare. Several rows fit in one statement: one `(…)` group per row, separated by commas.
You don't have to supply every column. A column declared `serial` is backed by a sequence — a counter the database owns — and gets the next number automatically whenever you leave it out. That is how `id` columns usually work: the app never invents ids, the database hands them out.
The habit: look at the table, name only the columns you have data for, let defaults do the rest.
    \d products                                         which columns, which are serial / not null
    insert into t (a, b) values ('x', 1);              one row, two named columns
    insert into t (a, b) values ('x', 1), ('y', 2);    two rows in one statement
    select * from t;                                   see what is there now
Try it first: `select * from products;` — zero rows, but the column headers show what a row needs.
Your task: "`products` exists but is empty. Put the launch catalogue in: Keyboard 49.90, Monitor 199.00, Mouse 19.90." DB: `psql postgres://postgres:wg@localhost:5433/wg` (no psql? `docker exec -it wg-pg psql -U postgres -d wg`). Work = run SQL.
Goal: exactly those 3 rows in `products` (`name`, `price`); `id` fills itself.
Check yourself:  wg check      stuck?  wg hint
