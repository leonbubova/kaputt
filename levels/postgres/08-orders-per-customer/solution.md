    select c.name, count(*) as orders from orders o join customers c on c.id = o.customer_id group by c.id, c.name order by orders desc;   → ~/.k8s-wargame/postgres/query.sql
