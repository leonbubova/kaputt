source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
snapshot
grep -q 'href="/hello"' src/app/layout.tsx || fail "src/app/layout.tsx has no link to /hello — the menu lives there, not in the pages"
dev_up
for p in / /about /hello; do get $p; want 200 "$p"; body_has 'href="/hello"' "$p shows no Hello link — is the file saved?"; done
get /hello; body_has '<p>hello, Ada</p>' "the /hello page itself must stay as it was"
ok "the Hello link is on every page — one layout wraps them all"
