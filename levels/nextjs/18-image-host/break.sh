source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
sed -i '' 's#https://cdn.wurm.example/#https://cdn.wurm-assets.example/#' "$APP/src/app/gallery/page.tsx"
