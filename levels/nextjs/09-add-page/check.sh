source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
snapshot
dev_up; get /about; want 200 "/about"; body_has '<h1>About</h1>' "no <h1>About</h1> on /about"; body_has 'data-testid="shop-name"' "root layout not applied"
ok "/about exists"
