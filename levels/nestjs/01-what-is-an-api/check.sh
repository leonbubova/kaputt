source "$WG_ROOT/levels/nestjs/nest.sh"
f=$APP/answer.txt
[ -f "$f" ] || fail "no answer.txt in $APP yet — curl the route and send its output into the file with >"
[ -s "$f" ] || fail "answer.txt is empty — was the API running (npm run start:dev in terminal 1) when curl ran?"
grep -q 'Ada Lovelace' "$f" || fail "answer.txt does not hold user 1 (Ada Lovelace) — it holds: $(head -c 100 "$f")"
ok "answer.txt holds the API's answer for /users/1 — request sent, answer received"
