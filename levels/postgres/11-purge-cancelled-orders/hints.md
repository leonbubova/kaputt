## 1
A WHERE can compare against the result of another query — a subquery: `col IN (SELECT …)`. Start with the inner list: `select id from customers where cancelled;`
## 2
Use that list in the WHERE of orders: `where customer_id in (select id from customers where cancelled)`. Run it as a SELECT first and count what would go.
## 3
`delete from orders where customer_id in (select id from customers where cancelled);`
