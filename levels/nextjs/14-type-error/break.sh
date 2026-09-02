source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
sed -i '' 's/export function ProductList({ products }: { products: Product\[\] })/export function ProductList({ products }: { products: Product })/' "$APP/src/components/ProductList.tsx"
