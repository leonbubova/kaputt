source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
n=$(sql "select count(*) from auth.users where email='lesson@example.com'")
[ "$n" -ge 1 ] || fail "no user lesson@example.com in auth.users yet — POST the signup to \$API_URL/auth/v1/signup with the anon key"
[ "$(sql "select count(*) from auth.users where email='lesson@example.com' and encrypted_password is not null and encrypted_password <> ''")" -ge 1 ] || fail "lesson@example.com exists but has no password — sign up through the API, not by inserting into auth.users"
ok "lesson@example.com signed up through Auth — your first user"
