source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
snapshot
cmp -s src/app/layout.tsx "$TPL/src/app/layout.tsx" || fail "root layout changed — set the title on the page"
dev_up; get /dashboard; want 200 "/dashboard"; body_has '<title>Dashboard</title>' "no <title>Dashboard</title> on /dashboard"
get /; want 200 "/"; body_has '<title>Wurm Shop</title>' "/ lost its title"
ok "/dashboard has its own title"
