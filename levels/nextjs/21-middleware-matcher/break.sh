source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
sed -i '' 's#matcher: \["/legacy/:path\*", "/legacy"\]#matcher: ["/legacy-links/:path*"]#' "$APP/src/middleware.ts"
