Two problems in `20240902090000_tags.sql`: `NOT NUL` (syntax error) and a seed row referencing article 3, which doesn't exist (FK violation).
    cd ~/.k8s-wargame/supabase/project
    sed -i.bak -e 's/NOT NUL unique/NOT NULL unique/' -e 's/(3, 2)/(2, 2)/' supabase/migrations/20240902090000_tags.sql
    supabase db reset
