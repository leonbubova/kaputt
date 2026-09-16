source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
rm -f "$APP/src/components/LikeButton.tsx"
sed -i '' '/LikeButton/d' "$APP/src/app/products/[slug]/page.tsx"
