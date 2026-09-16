source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
perl -0pi -e 's/import type \{ Product \} from "\@\/lib\/products";/import { getProducts } from "\@\/lib\/products";/; s/export function ProductList\(\{ products \}: \{ products: Product\[\] \}\) \{\n/export function ProductList() {\n  const products = getProducts();\n/' "$APP/src/components/ProductList.tsx"
perl -0pi -e 's/import \{ getProducts \} from "\@\/lib\/products";\n//; s/  const products = getProducts\(\);\n//; s/<ProductList products=\{products\} \/>/<ProductList \/>/' "$APP/src/app/products/page.tsx"
