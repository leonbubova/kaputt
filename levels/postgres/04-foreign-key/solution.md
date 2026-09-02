    delete from orders where customer_id not in (select id from customers);
    alter table orders add foreign key (customer_id) references customers (id);
