# adding a row — INSERT
Lesson: a new row goes in with INSERT. You name the table, the columns you are filling, and the values in the
same order:
    insert into pets (name, species, age) values ('Rex', 'dog', 3);
The `id` column is not in that list — in this table it fills itself (each new row gets the next number).
Text in single quotes, numbers bare, exactly like in WHERE. Postgres answers `INSERT 0 1`: one row added.
Try it:
    wg shell
    insert into pets (name, species, age) values ('Kiwi', 'parrot', 2);
    select * from pets;
Kiwi is now the last row, with an id you never typed. Insert a second one if you like — rows are cheap.
Your task: add a pet named `Luna`, species `cat`, age `2` to `pets`. The 7 original pets stay as they are.
Check yourself:  wg check      stuck?  wg hint
