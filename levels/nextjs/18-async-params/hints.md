## 1
`npm run build` prints the type error with file and line: `src/app/products/[slug]/page.tsx`. The dev log adds a link: nextjs.org/docs/messages/sync-dynamic-apis.
## 2
In Next.js 15 `params` (and `searchParams`) are **Promises**. Accessing `params.slug` directly is a deprecated shim in dev and a type error in build.
## 3
Make the page `async`, type `params: Promise<{ slug: string }>`, and `const { slug } = await params;`.
