# making a table — CREATE TABLE, types, primary key
Lesson: a table is declared once with CREATE TABLE: its name, then each column as `name type`, comma-separated,
in parentheses. The type says what a column may hold:
    integer      whole numbers          text        any text          numeric(10,2)   money-like, 2 decimals
    boolean      true / false           timestamptz  a point in time (date + time + zone)
One column is usually marked `primary key`: the id of the row. Postgres then guarantees it is never empty and
never repeats — two rows can never share an id.
    create table toys (id integer primary key, name text, price numeric(10,2));
Try it:
    wg shell
    create table toys (id integer primary key, name text, price numeric(10,2));
    \d toys
    insert into toys (id, name, price) values (1, 'ball', 2.50);
`\d toys` lists the columns you declared and, underneath, the primary key. (Here `id` is a plain integer, so you type it yourself on insert.)
Your task: create a table `owners` with exactly these columns: `id` integer and the primary key, `name` text, `email` text.
Check yourself:  wg check      stuck?  wg hint
