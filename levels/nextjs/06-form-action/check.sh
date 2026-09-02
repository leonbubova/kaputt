source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
snapshot
grep -rq '"use server"' src/app/newsletter 2>/dev/null || fail "no \"use server\" directive under src/app/newsletter — where is the Server Action?"
dev_up; get /newsletter; want 200 "/newsletter"; body_has '<form' "no form on /newsletter"; body_has 'name="email"' "no <input name=\"email\">"
id=$(grep -o 'ACTION_ID_[0-9a-f]*' body | head -1); [ -n "$id" ] || fail "form is not bound to a Server Action (no \$ACTION_ID in HTML)"
mail="wg-$RANDOM@example.com"; curl -s -o post.html -F "email=$mail" -F "\$$id=" "http://localhost:$PORT/newsletter" >/dev/null; sleep 1
grep -q "newsletter: $mail" dev.log || fail "the action did not log 'newsletter: $mail' on the server"
ok "newsletter form runs a Server Action"
