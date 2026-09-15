# purge the orders of cancelled customers
"Data protection: a customer with `cancelled = true` in `customers` must not keep any orders. Delete their orders — the customer rows themselves and everyone else's orders stay." DB: `psql postgres://postgres:wg@localhost:5433/wg` (no psql? `docker exec -it wg-pg psql -U postgres -d wg`). Work = run SQL.
Goal: no row in `orders` belongs to a cancelled customer; the 3 orders of active customers remain; `customers` unchanged.
