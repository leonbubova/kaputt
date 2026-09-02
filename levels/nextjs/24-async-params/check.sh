source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
snapshot
grep -q 'ignoreBuildErrors' next.config.* 2>/dev/null && fail "typescript.ignoreBuildErrors is cheating"
build
dev_up; get /products/regenwurm; want 200 "/products/regenwurm"; body_has 'data-testid="price">4,50' "price missing"
get /products/nope; want 404 "/products/nope (unknown slug)"
grep -q 'sync-dynamic-apis' dev.log && fail "still accessing params synchronously (see dev.log)"
ok "params awaited, build passes"
