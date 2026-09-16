source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
body=$(rest_svc POST "/rest/v1/comments" -H "Content-Type: application/json" -H "Prefer: return=minimal" -d '{"body":"one two  three four"}') || fail "API unreachable"
[ "$(rest_code)" = 201 ] || fail "POST /rest/v1/comments → $(rest_code): $body"
n=$(sql "select coalesce(word_count::text, 'NULL') from public.comments where body='one two  three four' order by id desc limit 1")
[ "$n" = 4 ] || fail "word_count is $n for 'one two  three four' (want 4)"
ok "word_count is filled by the database"
