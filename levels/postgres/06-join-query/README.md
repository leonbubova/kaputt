# JOIN combines rows from two tables on a matching column
Lesson: data lives split across tables — an order stores a `customer_id`, not the customer's name. A JOIN puts them back together for one query: `FROM orders o JOIN customers c ON c.id = o.customer_id` produces one combined row for every pair where the ON condition holds — one row per order, name attached.
`o` and `c` are aliases — short names for the tables, so `o.total` and `c.name` say unambiguously which side a column comes from. The SELECT list picks which columns survive; `ORDER BY … DESC` sorts biggest first.
A query saved in a file runs with `psql -f file` — the SQL is the deliverable, not the output.
    select c.name, o.total from orders o join customers c on c.id = o.customer_id;   combine on the id
    … order by o.total desc;                                                          largest first
    \i ~/.k8s-wargame/postgres/query.sql                                              run a file from inside psql
    psql postgres://postgres:wg@localhost:5433/wg -f query.sql                        run it from the shell
Try it first: `select * from orders;` — the ids are there, the names are not.
Your task: "One line per order: customer name and order total, biggest first. Put the query in `~/.k8s-wargame/postgres/query.sql` — we run it with psql." DB: `psql postgres://postgres:wg@localhost:5433/wg` (no psql? `docker exec -it wg-pg psql -U postgres -d wg`). Work = run SQL.
Goal: `query.sql` returns exactly two columns (`name`, `total`) from `customers` + `orders`, one row per order, ordered by total descending.
Check yourself:  wg check      stuck?  wg hint
