# GRANT comes before RLS: 42501 means the role may not touch the table at all
Lesson: every API request passes three layers in order: is the schema exposed, does the role have a privilege on the table (GRANT), and finally which rows do the policies allow. RLS is the last layer — it only filters rows for a role that is already allowed in.
The two failures look different. A missing policy is silent: `200 []`. A missing GRANT is loud: `42501 permission denied for table …`. The error code tells you which layer to look at; no policy work fixes a 42501.
Privileges are per role and per command: `select`, `insert`, `update`, `delete`. Grant only what the story needs; a read-only catalog gets `select`. Supabase grants these to `anon` and `authenticated` automatically for new tables in `public`; a `revoke` undoes that, and the policies still there do nothing.
    \dp public.products                                                     Access privileges per role (wg shell)
    grant select on table public.t to anon, authenticated;                  give read access
    select * from pg_policies where tablename='products';                   the policies are still there
Try it first: `\dp public.products` versus `\dp public.notes` — compare the Access privileges column of a normal table with the broken one.
Your task: "After last night's security hardening the shop page is dead: `GET /rest/v1/products` → `42501 permission denied for table products`. RLS policies look fine."
Goal: anon can read the catalog again — read only, anon must not be able to insert.
Check yourself:  wg check      stuck?  wg hint
