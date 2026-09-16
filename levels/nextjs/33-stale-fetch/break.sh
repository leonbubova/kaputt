source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
sed -i '' 's/{ cache: "no-store" }/{ cache: "force-cache" }/' "$APP/src/app/stock/page.tsx"
