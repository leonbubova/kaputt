# some invoices show an empty total
"`invoice_totals` is what the billing PDF reads. Invoices 2 and 5 print no total at all and the month sum is way too low. Amount and discount are in `invoices`." DB: `psql postgres://postgres:wg@localhost:5433/wg` (no psql? `docker exec -it wg-pg psql -U postgres -d wg`).
Goal: every row of `invoice_totals` has a `total` (amount minus discount; no discount = full amount); no invoice deleted.
