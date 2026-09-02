source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
snapshot
dev_up; get /; want 200 "/"; body_has '<title>Wurm Shop</title>' "no <title>Wurm Shop</title> in /"
get /about; body_has '<title>Wurm Shop</title>' "no <title> on /about (metadata should come from the layout)"
ok "title present"
