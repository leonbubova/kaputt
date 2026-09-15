source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
snapshot
[ -f src/app/shop/page.tsx ] || fail "no src/app/shop/page.tsx"
grep -q 'redirect(' src/app/shop/page.tsx || fail "use redirect() from next/navigation"
grep -q 'shop' src/middleware.ts 2>/dev/null && fail "not in middleware — redirect from the page"
grep -q 'redirects' next.config.* 2>/dev/null && fail "not in next.config — redirect from the page"
dev_up; get /shop; case "$CODE" in 30[12378]) ;; *) server_error; fail "/shop answered $CODE (want redirect)";; esac
case "$LOC" in */products) ;; *) fail "/shop redirects to '$LOC' (want /products)";; esac
get /products; want 200 "/products"
ok "/shop redirects to /products"
