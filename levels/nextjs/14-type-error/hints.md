## 1
Reproduce locally: `npm run typecheck` (or `npm run build`). The error points at a file and line.
## 2
Read the message: *Type 'Product[]' is not assignable to type 'Product'* — the page passes an array, the component's prop type says single object. One of them is wrong; the component maps over it.
## 3
`src/components/ProductList.tsx`: change the props type to `{ products: Product[] }`.
