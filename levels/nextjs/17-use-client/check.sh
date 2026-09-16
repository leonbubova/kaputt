source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
snapshot
dev_up; get /dashboard; want 200 "/dashboard"; body_has 'data-testid="counter"' "counter widget missing"; body_has 'count:' "counter text missing"
grep -q '^"use client"' src/components/Counter.tsx || grep -q '^"use client"' src/app/dashboard/page.tsx || fail "counter is not a Client Component — it cannot react to clicks"
ok "/dashboard renders with counter"
