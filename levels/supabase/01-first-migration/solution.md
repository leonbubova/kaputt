    cd ~/.k8s-wargame/supabase/project && supabase migration new notes
    cat > supabase/migrations/*_notes.sql <<'SQL'
    create table public.notes (id bigint generated always as identity primary key, body text not null, created_at timestamptz not null default now());
    SQL
    supabase migration up
