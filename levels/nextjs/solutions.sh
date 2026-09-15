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
s06(){ cp -R "$_T/src/app/newsletter" "$_A/src/app/newsletter"; }
s07(){ cp -R "$_T/src/app/guestbook" "$_A/src/app/guestbook"; cp "$_T/src/lib/guestbook.ts" "$_A/src/lib/"; }
s08(){ cp "$_T/src/app/api/health/route.ts" "$_A/src/app/api/health/route.ts"; }
s09(){ cp "$_T/src/components/Counter.tsx" "$_A/src/components/Counter.tsx"; }
s10(){ cp "$_T/src/app/dashboard/page.tsx" "$_A/src/app/dashboard/page.tsx"; }
s11(){ sed -i '' 's/export const metaData/export const metadata/' "$_A/src/app/layout.tsx"; }
s12(){ cp "$_T/src/middleware.ts" "$_A/src/middleware.ts"; }
s13(){ cp "$_T/src/middleware.ts" "$_A/src/middleware.ts"; }
s14(){ cp -R "$_T/src/app/(legal)" "$_A/src/app/(legal)"; }
s15(){ mv "$_A/src/app/(products)" "$_A/src/app/products"; }
s16(){ cp "$_T/src/app/layout.tsx" "$_A/src/app/layout.tsx"; }
s17(){ cp -R "$_T/src/app/gallery" "$_A/src/app/gallery"; }
s18(){ sed -i '' 's/cdn.wurm.example/cdn.wurm-assets.example/' "$_A/next.config.ts"; }
s19(){ cp "$_T/src/components/ProductList.tsx" "$_A/src/components/ProductList.tsx"; }
s20(){ cp "$_T/.env.local" "$_A/.env.local"; cp "$_T/src/app/about/page.tsx" "$_A/src/app/about/page.tsx"; }
s21(){ sed -i '' 's/SHOP_NAME/NEXT_PUBLIC_SHOP_NAME/' "$_A/.env.local" "$_A/src/components/ShopName.tsx"; }
s22(){ cp "$_T/src/components/ProductList.tsx" "$_A/src/components/ProductList.tsx"; cp "$_T/src/app/products/page.tsx" "$_A/src/app/products/page.tsx"; }
s23(){ cp "$_T/src/components/Clock.tsx" "$_A/src/components/Clock.tsx"; }
s24(){ cp "$_T/src/app/products/[slug]/page.tsx" "$_A/src/app/products/[slug]/page.tsx"; }
s25(){ cp "$_T/src/app/stock/page.tsx" "$_A/src/app/stock/page.tsx"; }
s26(){ cp -R "$_T/src/app/shop" "$_A/src/app/shop"; }
s27(){ cp "$_T/src/app/go/page.tsx" "$_A/src/app/go/page.tsx"; }
s28(){ cp "$_T/src/app/cart/actions.ts" "$_A/src/app/cart/actions.ts"; }
