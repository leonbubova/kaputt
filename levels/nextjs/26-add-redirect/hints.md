## 1
`redirect(path)` from `next/navigation` ends rendering of a Server Component and sends the browser elsewhere. Call it inside the page's component — nothing needs to be returned after it.
## 2
`redirect()` never returns: it *throws* an internal `NEXT_REDIRECT` that Next.js turns into the 3xx. So the page is just `export default function Shop() { redirect("/products"); }`.
## 3
`mkdir -p src/app/shop && printf 'import { redirect } from "next/navigation";\nexport default function Shop() {\n  redirect("/products");\n}\n' > src/app/shop/page.tsx`
