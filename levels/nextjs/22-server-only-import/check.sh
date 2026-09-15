source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
snapshot
grep -q '^"use client"' src/components/ProductList.tsx || fail "ProductList must stay a Client Component (the filter needs state)"
grep -q 'useState' src/components/ProductList.tsx || fail "the filter needs its state back"
dev_up; get /products; want 200 "/products"; body_has 'data-testid="product-list"' "product list missing"
[ "$(grep -o '<li>' body | wc -l | tr -d ' ')" -ge 3 ] || fail "not all products rendered"; body_has 'placeholder="filter"' "filter box missing"
ok "/products renders, data stays on the server"
