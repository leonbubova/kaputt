source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
snapshot
grep -q '<h1>Hello</h1>' src/app/page.tsx || fail "src/app/page.tsx does not contain <h1>Hello</h1> yet — change the word Welcome and save"
dev_up; get /; want 200 "/"; body_has '<h1>Hello</h1>' "the server still sends the old heading — is the file saved?"
ok "the home page says Hello — you edited a page and the server picked it up"
