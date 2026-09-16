## 1
`\dt` shows the names of all tables. `\d NAME` shows one table's columns — the left column of that output is the column names. Do that for each of the three tables and look for `species`.
## 2
Inside psql: `\d pets`, `\d vets`, `\d visits`. One of them lists `species`. Then `\q`, and in the shell: `echo THATNAME > ~/.k8s-wargame/postgres/answer.txt`.
## 3
    wg shell
    \d pets
    \q
    echo pets > ~/.k8s-wargame/postgres/answer.txt
`pets` has the columns id, name, species, age.
