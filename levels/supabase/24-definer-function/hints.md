## 1
A function runs as somebody. By default (`security invoker`) that is the caller — role `anon` — and RLS on `orders` hides every row from it, so `count(*)` would be 0. See the mode of any function: `\df+ public.order_count` (Security column).
## 2
`security definer` makes the function run as its owner (`postgres`), who is not subject to the policies. The caller only gets what the function returns — the table stays closed. Definer functions should pin `set search_path = ''` and schema-qualify names.
## 3
`create function public.order_count() returns bigint language sql stable security definer set search_path = '' as $$ select count(*) from public.orders $$;` — then `curl -s -X POST http://127.0.0.1:54321/rest/v1/rpc/order_count -H "apikey: $ANON_KEY" -H "Content-Type: application/json" -d '{}'`
