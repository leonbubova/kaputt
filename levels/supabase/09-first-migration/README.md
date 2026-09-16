# first migration
Ticket: "Start the notes app schema. Add a migration `notes` in `~/.k8s-wargame/supabase/project/supabase/migrations/` that creates `public.notes` with `id bigint generated always as identity primary key`, `body text not null`, `created_at timestamptz not null default now()`. Apply it with the CLI."
Goal: the table exists and the migration shows as applied.
