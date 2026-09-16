# the shop has no products
"`products` exists but is empty. Put the launch catalogue in: Keyboard 49.90, Monitor 199.00, Mouse 19.90." DB: `psql postgres://postgres:wg@localhost:5433/wg` (no psql? `docker exec -it wg-pg psql -U postgres -d wg`). Work = run SQL.
Goal: exactly those 3 rows in `products` (`name`, `price`); `id` fills itself.
