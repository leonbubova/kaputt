source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
[ -d "$APP/src/app/products" ] && mv "$APP/src/app/products" "$APP/src/app/(products)"
