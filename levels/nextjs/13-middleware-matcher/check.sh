source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
snapshot
[ -d src/app/legacy ] && fail "don't add pages under /legacy — redirect instead"
dev_up
for p in /legacy /legacy/summer; do get $p; case "$CODE" in 30[1278]) ;; *) fail "$p answered $CODE (want redirect)";; esac
  case "$LOC" in */about) ;; *) fail "$p redirects to '$LOC' (want /about)";; esac; done
get /about; want 200 "/about"
ok "/legacy → /about"
