# talking to the database: psql and Studio
Lesson: under everything sits a Postgres database. You talk to it in SQL. Two ways in:
    wg shell        opens psql — a prompt where you type SQL, end each statement with ; and press Enter. Leave with \q
    Studio          http://127.0.0.1:54323 in a browser — click "Table Editor" to see tables, "SQL Editor" to run SQL
Both change the same database. psql is what this game uses; Studio is fine for looking.
Tables live in a schema — a named drawer. Yours go in the drawer called `public`, so a table is written `public.hello`.
Try it — inside `wg shell`:
    select now();
    \dt public.*
The first prints the time (the database answers!). The second lists tables in `public` — none yet.
Your task: create a table `public.hello` with two columns and put one row in it. Type these two statements in psql:
    create table public.hello (id bigint generated always as identity primary key, word text not null);
    insert into public.hello (word) values ('hi');
(`id` fills itself in — an identity column; you only give the `word`.) Check with `select * from public.hello;`, then `\q`.
Check yourself:  wg check      stuck?  wg hint
