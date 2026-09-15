    select c.name, o.total from orders o join customers c on c.id = o.customer_id order by o.total desc;   → ~/.k8s-wargame/postgres/query.sql
