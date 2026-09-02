# no customers table yet
"The CRM is a blank database. First thing the app needs is a `customers` table." DB: `psql postgres://postgres:wg@localhost:5433/wg` (no psql? `docker exec -it wg-pg psql -U postgres -d wg`). Work = run SQL.
Goal: table `customers` with columns `id` (integer), `name` (text), `email` (text), `created_at` (timestamp with time zone).
