# picking rows — WHERE
Lesson: SELECT returns every row. A WHERE clause keeps only the rows for which a condition is true:
    select * from pets where species = 'cat';       only the cats
    select name from pets where age > 4;            names of pets older than 4
Text values go in single quotes (`'cat'`), numbers do not (`4`). `=` is "equals", `>` and `<` compare numbers.
SQL can also be handed in as a file: psql runs every statement in the file. The checker does exactly that with
`~/.k8s-wargame/postgres/query.sql`, so a query you save there is a query you can hand to someone else.
Try it:
    wg shell
    select * from pets where species = 'dog';
    select name from pets where age > 4;
Your task: write a query that returns the `name` (only that column) of every pet whose species is `cat`. Test it
in psql, then — after `\q` — save the exact statement, `;` included, into the file `~/.k8s-wargame/postgres/query.sql`.
In the shell: `echo "select … ;" > ~/.k8s-wargame/postgres/query.sql` (double quotes outside, so the single quotes inside survive).
Check yourself:  wg check      stuck?  wg hint
