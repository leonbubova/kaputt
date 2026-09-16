## 1
The file is the source of truth. Change the file, then rebuild the database from it with `supabase db reset` (inside `~/.k8s-wargame/supabase/project`).
## 2
The edited line reads: `create table public.todos (id bigint generated always as identity primary key, title text not null, done boolean not null default false);` — mind the comma before `done`. Save, then `supabase db reset`. Wait until it prints "Finished supabase db reset".
## 3
    cd ~/.k8s-wargame/supabase/project
    echo "create table public.todos (id bigint generated always as identity primary key, title text not null, done boolean not null default false);" > supabase/migrations/*_todos.sql
    supabase db reset
