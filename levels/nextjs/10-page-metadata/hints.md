## 1
Next.js builds `<head>` from a `metadata` export: the root layout's one applies everywhere, and any `page.tsx` may export its own — nearest wins. Look at the top of `src/app/layout.tsx` for the shape.
## 2
The export must be named exactly `metadata` (an object; `Metadata` type from `next` is optional). A page-level `title` replaces the layout's title for that route only.
## 3
Add to `src/app/dashboard/page.tsx`: `export const metadata = { title: "Dashboard" };`
