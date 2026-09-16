    cd ~/.k8s-wargame/supabase/project
    printf "insert into public.notes (body) values ('one'), ('two'), ('three');\n" > supabase/seed.sql
    supabase db reset
