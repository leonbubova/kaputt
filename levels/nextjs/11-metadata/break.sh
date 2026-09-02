source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
sed -i '' 's/^export const metadata: Metadata/export const metaData: Metadata/' "$APP/src/app/layout.tsx"
