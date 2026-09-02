## 1
Read the error: `insert or update on table "orders" violates foreign key constraint … Key (customer_id)=(1) is not present in table "customers"`.
## 2
An order can only reference a customer that already exists. Look at the order of statements in `seed.sql`.
## 3
Move the `insert into customers` above the `insert into orders`, then re-run: `psql postgres://postgres:wg@localhost:5433/wg -v ON_ERROR_STOP=1 -f ~/.k8s-wargame/postgres/seed.sql`.
