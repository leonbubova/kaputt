## 1
The error message comes from PL/pgSQL, i.e. from a trigger function, not from PostgREST. List triggers: `select tgname, tgrelid::regclass, tgfoid::regproc from pg_trigger where not tgisinternal;`
## 2
Read the function body: `\sf public.set_slug` (psql). Which column does it reference on `new`? Compare with `\d posts`.
## 3
`create or replace function public.set_slug() …` with `new.title` instead of `new.titel`. The trigger picks up the new body automatically.
