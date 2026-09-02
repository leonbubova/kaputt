## 1
`orders.customer_id` holds a `customers.id`. A JOIN pairs rows on that: `FROM orders o JOIN customers c ON c.id = o.customer_id`.
## 2
Pick the two columns in the SELECT (`c.name, o.total`), sort with `ORDER BY o.total DESC`. Test in psql, then save the statement to the file.
## 3
`echo "select c.name, o.total from orders o join customers c on c.id = o.customer_id order by o.total desc;" > ~/.k8s-wargame/postgres/query.sql`
