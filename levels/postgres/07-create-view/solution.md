    create view customer_totals as select c.name, sum(o.total) as revenue from customers c join orders o on o.customer_id = c.id group by c.id, c.name;
