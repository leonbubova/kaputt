## 1
`select * from pets;` prints the whole table. The first column is `id`. Find the row where it says 6 and read the `name` in that row.
## 2
Inside psql: `select * from pets;` — then `\q` and `echo THENAME > ~/.k8s-wargame/postgres/answer.txt` in the shell.
## 3
    wg shell
    select * from pets;
    \q
    echo Simba > ~/.k8s-wargame/postgres/answer.txt
Row 6 is Simba, a cat aged 1.
