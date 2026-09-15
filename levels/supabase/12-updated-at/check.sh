source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
before=$(sql "select updated_at from public.tasks where id=1")
body=$(rest_svc PATCH "/rest/v1/tasks?id=eq.1" -H "Content-Type: application/json" -H "Prefer: return=minimal" -d "{\"done\":$( [ "$(sql "select done from public.tasks where id=1")" = t ] && echo false || echo true )}") || fail "API unreachable"
[ "$(rest_code)" = 204 ] || fail "PATCH → $(rest_code): $body"
after=$(sql "select updated_at from public.tasks where id=1")
[ "$(sql "select '$after'::timestamptz > '$before'::timestamptz")" = t ] || fail "updated_at unchanged after PATCH ($after)"
ok "updated_at moves on update"
