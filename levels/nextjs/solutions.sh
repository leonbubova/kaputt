# machine-applied solutions, one function per level — used by run-all.sh only
_A=$HOME/.k8s-wargame/nextjs/app
_HERE=$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" >/dev/null 2>&1 && pwd)
case "$_HERE" in */levels/nextjs) : ;; *) _HERE=${WG_ROOT:-$(cd "$_HERE/../.." && pwd)}/levels/nextjs ;; esac
_T=$_HERE/template
s01(){ cp -R "$_T/src/app/about" "$_A/src/app/about"; }
s02(){ cp "$_T/src/app/dashboard/layout.tsx" "$_A/src/app/dashboard/"; cp -R "$_T/src/app/dashboard/settings" "$_A/src/app/dashboard/settings"; }
s03(){ cp -R "$_T/src/app/posts" "$_A/src/app/posts"; }
s04(){ cp -R "$_T/src/app/api/ping" "$_A/src/app/api/ping"; }
s05(){ cp "$_T/src/components/LikeButton.tsx" "$_A/src/components/"; cp "$_T/src/app/products/[slug]/page.tsx" "$_A/src/app/products/[slug]/page.tsx"; }
s06(){ cp -R "$_T/src/app/guestbook" "$_A/src/app/guestbook"; cp "$_T/src/lib/guestbook.ts" "$_A/src/lib/"; }
s07(){ cp "$_T/src/app/api/health/route.ts" "$_A/src/app/api/health/route.ts"; }
s08(){ cp "$_T/src/components/Counter.tsx" "$_A/src/components/Counter.tsx"; }
s09(){ sed -i '' 's/export const metaData/export const metadata/' "$_A/src/app/layout.tsx"; }
s10(){ cp "$_T/src/middleware.ts" "$_A/src/middleware.ts"; }
s11(){ mv "$_A/src/app/(products)" "$_A/src/app/products"; }
s12(){ cp "$_T/src/app/layout.tsx" "$_A/src/app/layout.tsx"; }
s13(){ sed -i '' 's/cdn.wurm.example/cdn.wurm-assets.example/' "$_A/next.config.ts"; }
s14(){ cp "$_T/src/components/ProductList.tsx" "$_A/src/components/ProductList.tsx"; }
s15(){ sed -i '' 's/SHOP_NAME/NEXT_PUBLIC_SHOP_NAME/' "$_A/.env.local" "$_A/src/components/ShopName.tsx"; }
s16(){ cp "$_T/src/components/ProductList.tsx" "$_A/src/components/ProductList.tsx"; cp "$_T/src/app/products/page.tsx" "$_A/src/app/products/page.tsx"; }
s17(){ cp "$_T/src/components/Clock.tsx" "$_A/src/components/Clock.tsx"; }
s18(){ cp "$_T/src/app/products/[slug]/page.tsx" "$_A/src/app/products/[slug]/page.tsx"; }
s19(){ cp "$_T/src/app/stock/page.tsx" "$_A/src/app/stock/page.tsx"; }
s20(){ cp "$_T/src/app/go/page.tsx" "$_A/src/app/go/page.tsx"; }
s21(){ cp "$_T/src/app/cart/actions.ts" "$_A/src/app/cart/actions.ts"; }
