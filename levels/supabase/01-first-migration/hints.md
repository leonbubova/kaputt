## 1
The CLI scaffolds a timestamped file: `cd ~/.k8s-wargame/supabase/project && supabase migration new notes` → `supabase/migrations/<timestamp>_notes.sql`. Put your `create table …` in there.
## 2
Apply it: `supabase migration up` (applies pending files only) or `supabase db reset` (rebuilds the whole DB from all migrations + seed, ~45 s). Then `supabase migration list` shows the version as applied locally.
## 3
Verify in psql (`docker exec -it supabase_db_project psql -U postgres`): `\d public.notes`. The applied versions live in `supabase_migrations.schema_migrations`.
