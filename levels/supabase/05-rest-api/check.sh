source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/supabase/lib.sh"
f="$SB_DIR/fruits.json"; [ -f "$f" ] || fail "no file ~/.k8s-wargame/supabase/fruits.json yet — run the curl from the task with > at the end"
[ -s "$f" ] || fail "fruits.json is empty — was \$API_URL set? run: source ~/.k8s-wargame/supabase/env first"
grep -q 'apikey' "$f" && fail "fruits.json holds an error about the apikey — the -H \"apikey: \$ANON_KEY\" header is missing or empty"
[ "$(tr -d ' \n' < "$f" | cut -c1)" = '[' ] || fail "fruits.json does not start with [ — it should be the JSON list the API returns: $(head -c 120 "$f")"
for w in apple banana cherry; do grep -q "\"$w\"" "$f" || fail "fruits.json lacks \"$w\" — the API's answer has all three fruits"; done
ok "fruits.json holds the API's JSON — you read a table over HTTP with the anon key"
