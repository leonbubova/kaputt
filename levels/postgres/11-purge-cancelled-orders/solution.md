    delete from orders where customer_id in (select id from customers where cancelled);
