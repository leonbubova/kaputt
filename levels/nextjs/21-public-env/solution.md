`SHOP_NAME` lacks the `NEXT_PUBLIC_` prefix, so it is not inlined into the client bundle; the client component renders `undefined` after hydration.
    sed -i '' 's/SHOP_NAME/NEXT_PUBLIC_SHOP_NAME/' .env.local src/components/ShopName.tsx   # then restart dev
