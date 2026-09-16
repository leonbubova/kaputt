source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
ls "$SB_PROJECT"/supabase/migrations/*_tags.sql >/dev/null 2>&1 || fail "the tags migration file is gone — fix it, don't delete it"
(cd "$SB_PROJECT" && supabase db reset >/dev/null 2>&1) || fail "supabase db reset still fails"
sb_write_env
[ "$(sql "select count(*) from public.tags")" = 2 ] || fail "tags not seeded"
[ "$(sql "select is_nullable from information_schema.columns where table_schema='public' and table_name='tags' and column_name='name'")" = NO ] || fail "tags.name must stay NOT NULL"
[ "$(sql "select count(*) from public.article_tags")" = 2 ] || fail "article_tags not seeded"
try() { body=$(rest_anon GET "/rest/v1/tags?select=name") && [ "$(rest_code)" = 200 ] && [ "$(json_len "$body")" = 2 ]; }
retry 20 try || fail "GET /rest/v1/tags → ${REST_CODE:-?}: ${body:-}"
ok "migrations apply cleanly, tags live"
