source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
snapshot
[ -d src/app/hello ] || fail "no folder src/app/hello yet — mkdir src/app/hello"
[ -f src/app/hello/page.tsx ] || fail "src/app/hello exists but has no page.tsx — the file inside must be called exactly page.tsx"
dev_up; get /hello; want 200 "/hello"; body_has 'data-testid="shop-name"' "/hello answers but without the app around it"
ok "/hello answers — a folder under src/app with a page.tsx is a web address"
