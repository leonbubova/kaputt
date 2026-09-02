source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
snapshot
grep -q 'ignoreBuildErrors' next.config.* 2>/dev/null && fail "typescript.ignoreBuildErrors is cheating"
grep -q '"strict": true' tsconfig.json || fail "keep strict mode on"
typecheck
[ -n "${WG_FAST:-}" ] || build
dev_up; get /products; want 200 "/products"; [ "$(grep -o '<li>' body | wc -l | tr -d ' ')" -ge 3 ] || fail "product list incomplete"
ok "type-check and build pass"
