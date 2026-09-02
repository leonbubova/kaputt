# a foreign key ties a column to rows that must exist in another table
Lesson: tables reference each other by id: an order carries a `customer_id`, meaning "the customer whose `id` is this". Nothing stops a client from writing 42 there when no customer 42 exists — unless you tell the database about the relationship.
A FOREIGN KEY is that declaration: `orders.customer_id REFERENCES customers (id)`. From then on postgres refuses an order pointing at a missing customer, and refuses deleting a customer that still has orders. This is referential integrity.
Like every constraint, adding one checks the rows already there. Rows that break the promise — orphans — block the ALTER, so find and remove them first. A subquery does the finding.
    alter table a add foreign key (b_id) references b (id);   declare the link
    select * from a where b_id not in (select id from b);    rows pointing at nothing
    delete from a where …;                                    remove rows (always with a WHERE)
    \d a                                                      "Foreign-key constraints:" shows the link
Try it first: `select distinct customer_id from orders;` versus `select id from customers;`.
Your task: "Someone inserted orders for customer 42 — we have 3 customers. `orders.customer_id` must only ever reference a real `customers.id`." DB: `psql postgres://postgres:wg@localhost:5433/wg` (no psql? `docker exec -it wg-pg psql -U postgres -d wg`). Work = run SQL.
Goal: a FOREIGN KEY from `orders.customer_id` to `customers.id`; the bad rows are gone, the 3 valid orders stay.
Check yourself:  wg check      stuck?  wg hint
