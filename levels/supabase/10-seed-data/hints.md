## 1
`supabase/seed.sql` is plain SQL that runs after all migrations on every `supabase db reset` (`[db.seed] enabled = true` in config.toml). `id` is a generated identity column — insert only `body`.
## 2
`insert into public.notes (body) values ('one'), ('two'), ('three');` — then `cd ~/.k8s-wargame/supabase/project && supabase db reset` (about 45 s; it drops and rebuilds the local DB).
## 3
Check: `curl -s "http://127.0.0.1:54321/rest/v1/notes" -H "apikey: $ANON_KEY"` will still be `401`/`[]` — RLS is not set up yet, that's the next level. Use psql: `select count(*) from notes;`
