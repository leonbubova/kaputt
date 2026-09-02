# every payment hangs forever
"Since about an hour every `update accounts …` from the API just hangs; reads are fine. Nobody deployed anything. Someone mentioned a 'batch reconcile' script." DB: `psql postgres://postgres:wg@localhost:5433/wg` (no psql? `docker exec -it wg-pg psql -U postgres -d wg`).
Goal: `update accounts set balance = balance where id = 1` completes within a few seconds; all 3 accounts and their balances intact.
