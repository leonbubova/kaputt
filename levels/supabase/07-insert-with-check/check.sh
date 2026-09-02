source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
rls_on guestbook || fail "RLS on guestbook is off"
before=$(sql "select count(*) from public.guestbook")
body=$(rest_anon POST "/rest/v1/guestbook" -H "Content-Type: application/json" -H "Prefer: return=minimal" -d '{"name":"wg-check","message":"hello from the check"}') || fail "API unreachable"
[ "$(rest_code)" = 201 ] || fail "anon POST → $(rest_code): $body"
after=$(sql "select count(*) from public.guestbook"); [ "$after" -gt "$before" ] || fail "row was not stored"
# anon must still NOT be able to delete
rest_anon DELETE "/rest/v1/guestbook?name=eq.wg-check" >/dev/null 2>&1 || true
[ "$(sql "select count(*) from public.guestbook")" = "$after" ] || fail "anon can delete rows — too permissive (did you disable RLS?)"
ok "anon can sign, cannot delete"
