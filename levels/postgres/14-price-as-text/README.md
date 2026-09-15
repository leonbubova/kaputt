# prices were imported as text
"The catalogue import created `products.price` as text — `sum(price)` errors out and sorting puts 199.00 before 49.90. Make it a real `numeric(10,2)`; every product keeps its price." DB: `psql postgres://postgres:wg@localhost:5433/wg` (no psql? `docker exec -it wg-pg psql -U postgres -d wg`). Work = run SQL.
Goal: `products.price` is numeric, all 4 products keep their values, `select sum(price) from products` works.
