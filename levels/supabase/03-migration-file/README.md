# a table from a file: migrations
Lesson: typing SQL into psql works once, on your machine. A team needs the same tables everywhere, so the SQL goes
into files instead — migration files. One file = one change, named with a timestamp so they run in order.
The CLI creates the file, you fill it, the CLI runs it and remembers which files already ran. The files live in
`~/.k8s-wargame/supabase/project/supabase/migrations/`.
    supabase migration new NAME      creates supabase/migrations/<timestamp>_NAME.sql (empty)
    supabase migration up            runs every migration file that has not run yet
    supabase migration list          which files ran (Local column)
All three must be typed inside the project folder. Try it:
    cd ~/.k8s-wargame/supabase/project
    supabase migration list
    ls supabase/migrations
Your task: create a migration named `todos`, and write this one line into the new file (open it in any editor):
    create table public.todos (id bigint generated always as identity primary key, title text not null);
Then apply it with `supabase migration up`. Check in psql (`wg shell`): `\d public.todos`.
Work in ~/.k8s-wargame/supabase/project.
Check yourself:  wg check      stuck?  wg hint
