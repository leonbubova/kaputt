source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
snapshot
grep -q '^"use client"' src/components/ShopName.tsx || fail "ShopName must stay a Client Component"
grep -q 'process.env' src/components/ShopName.tsx || fail "keep reading the name from an environment variable"
dev_up; get /; want 200 "/"; body_has 'data-testid="shop-name">Wurm Shop<' "shop name not in server HTML"
# the client bundle must carry the value too, otherwise the browser renders undefined after hydration
found=""; for js in $(grep -o '/_next/static/chunks/[^"]*\.js[^"]*' body | sort -u); do curl -s "http://localhost:$PORT$js" | grep -q 'Wurm Shop' && { found=1; break; }; done
[ -n "$found" ] || fail "'Wurm Shop' is not in any client chunk — the browser renders undefined"
ok "shop name is public and reaches the browser"
