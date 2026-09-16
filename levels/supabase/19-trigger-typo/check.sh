source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
body=$(rest_svc POST "/rest/v1/posts" -H "Content-Type: application/json" -H "Prefer: return=representation" -d '{"title":"Hello World, Again","body":"x"}') || fail "API unreachable"
[ "$(rest_code)" = 201 ] || fail "POST /rest/v1/posts → $(rest_code): $body"
slug=$(sql "select slug from public.posts where title='Hello World, Again' order by id desc limit 1")
[ "$slug" = "hello-world-again" ] || fail "slug is '$slug' (want hello-world-again) — the slug trigger must still do its job"
ok "posts insert, slug generated"
