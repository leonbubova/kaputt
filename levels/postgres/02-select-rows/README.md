# reading rows — SELECT
Lesson: the data in a table sits in rows. You read rows with a SELECT statement. SQL statements are written
in plain words and always end with a semicolon `;` — press Enter without it and psql just waits for more
(the prompt turns into `wg-#`); type the `;` and Enter to finish.
    select * from pets;                 every column (that is what * means), every row
    select name, species from pets;     only these columns, every row
Try it:
    wg shell
    select * from pets;
    select name, age from pets;
Every row has an `id` — a number that identifies that one row and never changes. Upper or lower case does
not matter to SQL (`SELECT` and `select` are the same); the name of a table or column does.
Your task: look at the pets. Find the pet whose `id` is 6 and write its name — just the name — into
`~/.k8s-wargame/postgres/answer.txt` (from your normal shell, after `\q`).
Check yourself:  wg check      stuck?  wg hint
