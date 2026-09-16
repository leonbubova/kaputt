source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
snapshot
[ -f src/app/hello/page.tsx ] || fail "src/app/hello/page.tsx is gone"
grep -qE '\{ *worms' src/app/hello/page.tsx || fail "the paragraph must compute the number: {worms * 2} inside the JSX, not a typed-out 6"
dev_up; get /hello; want 200 "/hello"
sed 's/<!-- -->//g' "$BODY" > "$BODY.s" && mv "$BODY.s" "$BODY"
body_has '<p>6 worms</p>' "/hello does not show '6 worms' — const worms = 3 before return, <p>{worms * 2} worms</p> in the section"
body_has '<p>I wrote this myself.</p>' "the earlier paragraphs must stay"
ok "6 worms — braces run JavaScript inside JSX"
