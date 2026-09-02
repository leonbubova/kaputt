## 1
Find the orphans: `select * from orders o where not exists (select 1 from customers c where c.id = o.customer_id);`
## 2
A foreign key can't be added while orphans exist — delete them first. Then `ALTER TABLE orders ADD FOREIGN KEY (customer_id) REFERENCES customers (id);`
## 3
`delete from orders where customer_id not in (select id from customers); alter table orders add foreign key (customer_id) references customers (id);`
