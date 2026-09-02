## 1
A foreign key is a promise that every `orders.customer_id` exists in `customers` — postgres checks the rows already there when you add it, so anything breaking the promise blocks it. Find the orphans: `select * from orders o where not exists (select 1 from customers c where c.id = o.customer_id);`
## 2
A foreign key can't be added while orphans exist — delete them first. Then `ALTER TABLE orders ADD FOREIGN KEY (customer_id) REFERENCES customers (id);`
## 3
`delete from orders where customer_id not in (select id from customers); alter table orders add foreign key (customer_id) references customers (id);`
