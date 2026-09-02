The `"use client"` component imports `lib/products.ts`, which reads the filesystem — that module gets bundled for the browser. Fetch on the server, pass down as props.
    # page.tsx: const products = getProducts(); <ProductList products={products} />
    # ProductList.tsx: export function ProductList({ products }: { products: Product[] }) — remove the getProducts import
