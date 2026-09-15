source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
snapshot
grep -q '^"use client"' src/components/AddForm.tsx || fail "AddForm must stay a Client Component"
grep -q 'addToCart' src/app/cart/actions.ts || fail "keep addToCart in actions.ts"
dev_up; get /cart; want 200 "/cart"; body_has '<form' "form missing"; body_has 'ACTION_ID' "form is not bound to a Server Action"
ok "/cart renders with a Server Action"
