## 1
NULL means "no value" — selecting it prints nothing. `select * from customers;` — `nickname` is NULL for Ben and Dan, and that is what the query prints.
## 2
`coalesce(a, b)` returns the first argument that is not NULL: `coalesce(nickname, name)` gives the nickname when set, the name otherwise. Keep the column name `display`.
## 3
`echo "select id, coalesce(nickname, name) as display from customers order by id;" > ~/.k8s-wargame/postgres/query.sql`
