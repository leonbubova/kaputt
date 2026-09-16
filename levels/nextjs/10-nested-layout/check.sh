source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
snapshot
[ -f src/app/dashboard/layout.tsx ] || fail "no src/app/dashboard/layout.tsx — the nav belongs in a nested layout"
grep -q 'dashboard-nav' src/app/dashboard/page.tsx && fail "nav is copied into the page, not the layout"
dev_up
for p in /dashboard /dashboard/settings; do get $p; want 200 "$p"; body_has 'data-testid="dashboard-nav"' "no dashboard-nav on $p"; body_has 'href="/dashboard/settings"' "nav on $p lacks the Settings link"; body_has 'data-testid="shop-name"' "root layout lost on $p"; done
get /dashboard; body_has 'data-testid="counter"' "dashboard content missing"
ok "nested layout shared by /dashboard/*"
