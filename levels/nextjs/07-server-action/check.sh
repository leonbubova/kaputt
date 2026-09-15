source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
snapshot
grep -rq '"use server"' src/app/guestbook src/lib 2>/dev/null || grep -rq '"use server"' src 2>/dev/null || fail "no \"use server\" directive anywhere — where is the Server Action?"
grep -rq 'revalidatePath\|revalidateTag' src 2>/dev/null || fail "the action must revalidate the page"
dev_up; get /guestbook; want 200 "/guestbook"; body_has 'data-testid="guestbook"' "no <ul data-testid=\"guestbook\">"
body_has '<form' "no form"; id=$(grep -o 'ACTION_ID_[0-9a-f]*' body | head -1); [ -n "$id" ] || fail "form is not bound to a Server Action (no \$ACTION_ID in HTML)"
name="wg-$RANDOM"; curl -s -o post.html -F "name=$name" -F "\$$id=" "http://localhost:$PORT/guestbook" >/dev/null
get /guestbook; want 200 "/guestbook"; body_has "<li>$name</li>" "POSTed name '$name' not in the list on the next GET"
ok "guestbook appends via server action"
