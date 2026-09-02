# catalog: permission denied
"After last night's security hardening the shop page is dead: `GET /rest/v1/products` → `42501 permission denied for table products`. RLS policies look fine." Goal: anon can read the catalog again — read only, anon must not be able to insert.
