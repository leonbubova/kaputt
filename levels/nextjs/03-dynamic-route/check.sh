source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
snapshot
[ -n "${WG_FAST:-}" ] || build
dev_up
get /posts/hello-world; want 200 "/posts/hello-world"; body_has 'data-testid="post-slug">hello-world<' "slug not rendered in post-slug heading"
get /posts/zweiter; want 200 "/posts/zweiter"; body_has 'data-testid="post-slug">zweiter<' "second slug not rendered"
grep -q 'sync-dynamic-apis' dev.log && fail "params accessed synchronously — in Next 15 params is a Promise (see dev.log)"
ok "/posts/[slug] works"
