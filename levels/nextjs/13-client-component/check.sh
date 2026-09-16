source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
snapshot
grep -q '^"use client"' 'src/app/products/[slug]/page.tsx' && fail "the product page must stay a Server Component"
[ -f src/components/LikeButton.tsx ] || fail "no src/components/LikeButton.tsx"
grep -q '^"use client"' src/components/LikeButton.tsx || fail "LikeButton.tsx needs the \"use client\" directive (it uses state and onClick)"
grep -q 'useState' src/components/LikeButton.tsx || fail "LikeButton has no state to count with"
dev_up; get /products/regenwurm; want 200 "/products/regenwurm"; body_has 'data-testid="like-button"' "like button not rendered"; body_has 'likes: <!-- -->0\|likes: 0' "button does not show 'likes: 0'"
body_has 'data-testid="price"' "price disappeared"
ok "like button rendered from a server page"
