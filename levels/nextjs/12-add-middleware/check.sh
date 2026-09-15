source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
snapshot
[ -f src/middleware.ts ] || fail "no src/middleware.ts"
grep -q 'matcher' src/middleware.ts || fail "middleware runs on every request — add config.matcher"
[ -d src/app/legacy ] && fail "don't add pages under /legacy — redirect instead"
grep -q 'legacy' next.config.* 2>/dev/null && fail "do it in middleware, not next.config"
dev_up
for p in /legacy /legacy/summer; do get $p; case "$CODE" in 30[1278]) ;; *) fail "$p answered $CODE (want redirect)";; esac
  case "$LOC" in */about) ;; *) fail "$p redirects to '$LOC' (want /about)";; esac; done
get /about; want 200 "/about"
ok "middleware redirects /legacy → /about"
