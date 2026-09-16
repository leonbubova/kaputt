source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
f=$(ls "$SB_PROJECT"/supabase/migrations/*todos*.sql 2>/dev/null | head -1); [ -n "$f" ] || fail "no file supabase/migrations/*_todos.sql — create it with: supabase migration new todos"
grep -qi 'create table' "$f" || fail "$(basename "$f") is empty — put the create table line into it"
[ "$(sql "select to_regclass('public.todos') is not null")" = t ] || fail "the file exists but public.todos does not — run: supabase migration up"
[ "$(sql "select count(*) from information_schema.columns where table_schema='public' and table_name='todos' and column_name='title'")" = 1 ] || fail "public.todos has no column 'title'"
ver=$(basename "$f" | cut -d_ -f1)
[ "$(sql "select count(*) from supabase_migrations.schema_migrations where version='$ver'")" = 1 ] || fail "public.todos exists but migration $ver is not recorded as run — apply the file with 'supabase migration up', not by typing the SQL into psql"
ok "todos table created by migration $ver"
