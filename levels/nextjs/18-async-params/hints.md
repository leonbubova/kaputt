## 1
A major upgrade changes contracts: in Next 15 a page no longer receives its route data synchronously, and the framework's own `PageProps` type enforces the new shape — so code that type-checked on 14 fails on 15 while dev limps along with a warning. `npm run build` prints the type error with file and line: `src/app/products/[slug]/page.tsx`. The dev log adds a link: nextjs.org/docs/messages/sync-dynamic-apis.
## 2
In Next.js 15 `params` (and `searchParams`) are **Promises**. Accessing `params.slug` directly is a deprecated shim in dev and a type error in build.
## 3
Make the page `async`, type `params: Promise<{ slug: string }>`, and `const { slug } = await params;`.
