    cd ~/.k8s-wargame/supabase/project && supabase migration new todos
    echo "create table public.todos (id bigint generated always as identity primary key, title text not null);" > supabase/migrations/*_todos.sql
    supabase migration up
