## 1
WHERE keeps only rows that match: `where species = 'cat'`. The SELECT part says which columns you want — here only `name`.
## 2
`select name from pets where species = 'cat';` — try it in psql first, it should show Milo, Nala, Simba. Then put that exact line into the file.
## 3
    echo "select name from pets where species = 'cat';" > ~/.k8s-wargame/postgres/query.sql
Double quotes around the whole statement keep the single quotes inside intact.
