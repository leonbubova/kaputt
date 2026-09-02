## 1
The dev-server error names the import chain: `ProductList.tsx` → `lib/products.ts` → `fs`. Which of those files starts with `"use client"`?
## 2
A Client Component is bundled for the browser, and the browser has no `fs`. Server-only code (files, DB, secrets) belongs in Server Components; the client gets the *result* as props.
## 3
Load the data in `src/app/products/page.tsx` (a Server Component): `const products = getProducts();` and render `<ProductList products={products} />`; make `ProductList` accept `{ products: Product[] }` and drop its `getProducts` import.
