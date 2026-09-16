source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
sql "delete from auth.users where email='lesson@example.com'" >/dev/null
