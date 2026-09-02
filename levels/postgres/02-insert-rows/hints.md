## 1
`\d products` shows the columns. `id` is `serial` — it gets a value automatically, so you only supply `name` and `price`.
## 2
`INSERT INTO table (col, col) VALUES (…), (…), (…);` — several rows in one statement, text in single quotes.
## 3
`insert into products (name, price) values ('Keyboard', 49.90), ('Monitor', 199.00), ('Mouse', 19.90);` then `select * from products;`
