## 1
`permission denied` (42501) is a *privilege* error, not RLS. RLS only filters rows once you are allowed to touch the table at all. Two layers: GRANT, then policies.
## 2
Inspect the table grants: `\dp public.products` in psql (Access privileges column). Compare with another table created normally.
## 3
`grant select on table public.products to anon, authenticated;`
