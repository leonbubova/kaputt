source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
f=$(ls "$SB_PROJECT"/supabase/migrations/*notes*.sql 2>/dev/null | head -1); [ -n "$f" ] || fail "no migration file matching supabase/migrations/*notes*.sql"
grep -qi 'create table' "$f" || fail "$(basename "$f") has no CREATE TABLE"
[ "$(sql "select to_regclass('public.notes') is not null")" = t ] || fail "table public.notes does not exist in the database (did you apply the migration?)"
[ "$(sql "select count(*) from information_schema.columns where table_schema='public' and table_name='notes' and column_name='body' and is_nullable='NO'")" = 1 ] || fail "notes.body must exist and be NOT NULL"
ver=$(basename "$f" | cut -d_ -f1)
[ "$(sql "select count(*) from supabase_migrations.schema_migrations where version='$ver'")" = 1 ] || fail "migration $ver is not recorded as applied — apply it with the CLI, not by hand"
ok "notes table created by migration $ver"
