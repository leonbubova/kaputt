source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
snapshot
[ -d src/app/imprint ] && fail "src/app/imprint exists — the page belongs in the (legal) group"
[ -f 'src/app/(legal)/imprint/page.tsx' ] || fail "no src/app/(legal)/imprint/page.tsx"
dev_up; get /imprint; want 200 "/imprint"; body_has '<h1>Imprint</h1>' "no <h1>Imprint</h1> on /imprint"; body_has 'data-testid="shop-name"' "root layout not applied"
get '/(legal)/imprint'; want 404 "/(legal)/imprint (group must not be in the URL)"
ok "/imprint served from the (legal) route group"
