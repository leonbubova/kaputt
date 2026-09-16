## 1
A migration is SQL in a file that the CLI runs for you. Three steps: create the file, write the SQL into it, apply it. All from inside `~/.k8s-wargame/supabase/project`.
## 2
`supabase migration new todos` prints the path of the new file (`supabase/migrations/<numbers>_todos.sql`). Open that file, paste the create table line, save. Then `supabase migration up`.
## 3
    cd ~/.k8s-wargame/supabase/project
    supabase migration new todos
    echo "create table public.todos (id bigint generated always as identity primary key, title text not null);" > supabase/migrations/*_todos.sql
    supabase migration up
