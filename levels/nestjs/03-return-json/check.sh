source "$WG_ROOT/levels/nestjs/nest.sh"
boot_or_fail
body=$(get /health)
echo "$body" | grep -q '"version":2' || fail "GET /health answers $body — no \"version\":2 in it (a number, no quotes)"
echo "$body" | grep -q '"status":"ok"' || fail "GET /health lost status: ok — keep the existing keys"
echo "$body" | grep -qE '"uptime":[0-9]+' || fail "GET /health lost uptime — keep the existing keys"
ok "GET /health reports version 2 — a key in the object, a field in the JSON"
