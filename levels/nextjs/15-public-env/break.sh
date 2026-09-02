source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
sed -i '' 's/NEXT_PUBLIC_SHOP_NAME/SHOP_NAME/' "$APP/src/components/ShopName.tsx" "$APP/.env.local"
