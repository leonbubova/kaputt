source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
snapshot
[ -f src/app/hello/page.tsx ] || fail "src/app/hello/page.tsx is gone"
grep -q 'getProducts' src/app/hello/page.tsx || fail "src/app/hello/page.tsx does not use getProducts — import it from \"@/lib/products\" and call it"
head -1 src/app/hello/page.tsx | grep -q 'use client' && fail "the page must stay a server component — no \"use client\" here"
dev_up; get /hello; want 200 "/hello"
sed 's/<!-- -->//g' "$BODY" > "$BODY.s" && mv "$BODY.s" "$BODY"
body_has 'data-testid="catalogue">3 products, first: Regenwurm Classic<' "/hello does not show '3 products, first: Regenwurm Classic' in the catalogue paragraph"
ok "the page read products.json on the server and sent finished HTML"
