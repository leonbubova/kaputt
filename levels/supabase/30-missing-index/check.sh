source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
[ "$(sql "select count(*) from public.page_views")" -ge 300000 ] || fail "rows went missing — don't delete data"
plan=$(sql "explain select * from public.page_views where user_id = 42")
printf '%s' "$plan" | grep -qi 'index' || fail "query still scans the whole table:
$plan"
ok "user lookup uses an index"
