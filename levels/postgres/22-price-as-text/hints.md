## 1
A column's type is changed in place — the rows stay: `ALTER TABLE t ALTER COLUMN c TYPE newtype`. `\d products` confirms `price` is `text` right now.
## 2
Text to a number is not automatic; postgres needs to be told how to convert each existing value: add `USING price::numeric` to the ALTER.
## 3
`alter table products alter column price type numeric(10,2) using price::numeric;` — `\d products` and `select sum(price) from products;` to confirm.
