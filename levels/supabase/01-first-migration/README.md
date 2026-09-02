# a migration is a versioned SQL file the CLI applies and remembers
Lesson: a Supabase database is not built by hand in Studio — it is built from files. A migration is one SQL file in `supabase/migrations/`, named `<timestamp>_<name>.sql`. The CLI runs them in timestamp order and records every version it ran in `supabase_migrations.schema_migrations`, so it never applies a file twice.
That record is the whole point: every dev, CI and production get the same schema by replaying the same files. A table created by hand in psql exists on your machine only.
The CLI scaffolds the file so the timestamp is right; you fill in the SQL; the CLI applies what is pending.
    cd ~/.k8s-wargame/supabase/project             every supabase command runs from the project dir
    supabase migration new name                    creates supabase/migrations/<ts>_name.sql (empty)
    supabase migration up                          applies files not yet recorded as applied
    supabase migration list                        which versions are applied locally
    \d public.notes                                describe the table (in wg shell)
Try it first: `wg shell`, then `select * from supabase_migrations.schema_migrations;` — the ledger is empty right now.
Your task: "Start the notes app schema. Add a migration `notes` in `~/.k8s-wargame/supabase/project/supabase/migrations/` that creates `public.notes` with `id bigint generated always as identity primary key`, `body text not null`, `created_at timestamptz not null default now()`. Apply it with the CLI."
Goal: the table exists and the migration shows as applied.
Check yourself:  wg check      stuck?  wg hint
