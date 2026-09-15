## 1
`count(*)` collapses rows into one number. With `GROUP BY` it gives one number per group: `select customer_id, count(*) from orders group by customer_id;` — one row per customer.
## 2
Join in the name like last time (`orders o join customers c on c.id = o.customer_id`), group by `c.id, c.name`, name the count `as orders`, sort with `order by orders desc`. Test in psql, then save it to the file.
## 3
`echo "select c.name, count(*) as orders from orders o join customers c on c.id = o.customer_id group by c.id, c.name order by orders desc;" > ~/.k8s-wargame/postgres/query.sql`
