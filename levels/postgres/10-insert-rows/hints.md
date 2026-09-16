## 1
A `serial` column fills itself from a sequence — you never write `id`, you name only the columns you supply and postgres does the rest. `\d products` shows the columns: `id` is `serial`, so you only supply `name` and `price`.
## 2
`INSERT INTO table (col, col) VALUES (…), (…), (…);` — several rows in one statement, text in single quotes.
## 3
`insert into products (name, price) values ('Keyboard', 49.90), ('Monitor', 199.00), ('Mouse', 19.90);` then `select * from products;`
