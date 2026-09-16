# change a migration, rebuild the database: db reset
Lesson: because every table comes from a migration file, the whole database can be thrown away and rebuilt from
the files. That is what `supabase db reset` does: drop everything, run all migration files in order, then load
`supabase/seed.sql` if it exists (starter rows). It takes about 45 seconds and every row you inserted by hand is gone.
    supabase db reset      rebuild the local database from the migration files
Use it after you EDIT a migration file that already ran — `migration up` skips files it has seen, reset runs them all again.
Try it — the migration `todos` from the last lesson is back in place and applied:
    cd ~/.k8s-wargame/supabase/project
    cat supabase/migrations/*_todos.sql
    supabase migration list
Your task: the todos table needs a third column. Edit the file `supabase/migrations/*_todos.sql` so the table gets
`done boolean not null default false` (add it inside the parentheses, after `title text not null`, separated by a comma).
Then run `supabase db reset`. Afterwards, in psql (`wg shell`), `\d public.todos` must show the `done` column.
Work in ~/.k8s-wargame/supabase/project.
Check yourself:  wg check      stuck?  wg hint
