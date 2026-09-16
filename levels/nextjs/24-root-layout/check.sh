source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
snapshot
dev_up; get /about; want 200 "/about"
body_has '<html lang="de"' "no <html lang=\"de\"> in the response"; body_has '<body' "no <body> in the response"
body_has 'data-testid="shop-name"' "header disappeared"; body_has '<h1>About</h1>' "page content missing"
ok "root layout renders a full document"
