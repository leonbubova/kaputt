source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
rls_on notes || fail "RLS on notes is off — it must stay enabled"
before=$(sql "select count(*) from public.notes")
body=$(rest_anon POST "/rest/v1/notes" -H "Content-Type: application/json" -H "Prefer: return=minimal" -d '{"body":"wg-check"}') || fail "API unreachable"
[ "$(rest_code)" = 201 ] || fail "anon POST /rest/v1/notes → $(rest_code): $body"
after=$(sql "select count(*) from public.notes"); [ "$after" -gt "$before" ] || fail "row was not stored"
rest_anon DELETE "/rest/v1/notes?body=eq.wg-check" >/dev/null 2>&1 || true
[ "$(sql "select count(*) from public.notes")" = "$after" ] || fail "anon can delete notes — insert only was the ask"
ok "anon can add notes, cannot delete"
