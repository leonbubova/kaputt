Add the column to the migration file, then rebuild:
    echo "create table public.todos (id bigint generated always as identity primary key, title text not null, done boolean not null default false);" > ~/.k8s-wargame/supabase/project/supabase/migrations/*_todos.sql
    cd ~/.k8s-wargame/supabase/project && supabase db reset
