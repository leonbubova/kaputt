# a public order counter
Ticket: "Marketing wants 'N orders so far' on the landing page. Create `order_count()` returning the number of rows in `orders`, callable as `POST /rest/v1/rpc/order_count` with the anon key → `4`. `orders` itself is private (RLS, no policies) and must stay that way — so the function has to run with its owner's rights, not the caller's (`security definer`)."
Goal: the RPC returns 4 for anon; `GET /rest/v1/orders` as anon still returns no rows.
