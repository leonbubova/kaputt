# the public counter says 0
"The landing page calls `POST /rest/v1/rpc/event_count` with the anon key to show 'N events so far'. It returns `0`. There are 5 rows in `events`. The raw table is intentionally not readable for anon and must stay that way." Goal: the RPC returns 5 for anon; `GET /rest/v1/events` as anon still returns no rows.
