# seed.sql gives every rebuilt database its starting rows
Lesson: migrations describe structure, not content. After `supabase db reset` rebuilds the database from all migrations, the tables are empty — and a dev with an empty `notes` table cannot see whether the frontend works.
`supabase/seed.sql` fixes that. It is plain SQL that the CLI runs once, after the last migration, on every reset (`[db.seed] enabled = true` in `config.toml`). Test data lives there, never in a migration: a migration runs on production too, a seed does not.
Reset is the only thing that runs the seed, and it drops the local database first — that is fine locally, that is what CI does on every run.
One detail: `id` is a generated identity column. Insert only the columns you own (`body`); Postgres fills the rest.
    insert into public.notes (body) values ('a'), ('b');     several rows in one statement
    supabase db reset                                        rebuild from all migrations + seed.sql (~45 s)
    select count(*) from public.notes;                       count rows (in wg shell)
Try it first: `cat ~/.k8s-wargame/supabase/project/supabase/config.toml | grep -A2 'db.seed'` — the seed is enabled and points at seed.sql.
Your task: "Every dev gets an empty `notes` table after `supabase db reset`. Add `supabase/seed.sql` (in `~/.k8s-wargame/supabase/project/`) inserting at least 3 notes, and make sure it's actually loaded."
Goal: `seed.sql` exists and `public.notes` has ≥ 3 rows.
Check yourself:  wg check      stuck?  wg hint
