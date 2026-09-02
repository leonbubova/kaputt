# orders point at customers that don't exist
"Someone inserted orders for customer 42 — we have 3 customers. `orders.customer_id` must only ever reference a real `customers.id`." DB: `psql postgres://postgres:wg@localhost:5433/wg` (no psql? `docker exec -it wg-pg psql -U postgres -d wg`). Work = run SQL.
Goal: a FOREIGN KEY from `orders.customer_id` to `customers.id`; the bad rows are gone, the 3 valid orders stay.
