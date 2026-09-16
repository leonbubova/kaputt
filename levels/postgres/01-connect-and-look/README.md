# a database, its tables — connecting and looking around
Lesson: a database is a program that keeps data for you, sorted into tables. A table is like one spreadsheet
sheet: fixed columns (each with a name and a type — number, text, date), and one row per thing. This game runs
one database server, Postgres, with one database inside it called `wg`. You talk to it by typing commands into
a program called psql — its prompt looks like `wg=#` and means "your turn", just like the shell.
Three psql commands to look around (they start with a backslash and need no `;`):
    \dt          list the tables in this database
    \d pets      describe one table: its columns and their types
    \q           quit psql, back to your normal shell
Try it — in your terminal:
    wg shell
    \dt
    \d pets
    \q
(`wg shell` opens psql for you. If psql is installed on your machine, this does the same: `psql postgres://postgres:wg@localhost:5433/wg`)
Your task: the database has three tables. Exactly one of them has a column called `species`. Find out which
by describing each table with `\d`, then — back in your normal shell after `\q` — write that table's name, just the name, into
the file `~/.k8s-wargame/postgres/answer.txt` (lesson 1 of the shell track showed how: `echo WORD > FILE`).
Check yourself:  wg check      stuck?  wg hint
