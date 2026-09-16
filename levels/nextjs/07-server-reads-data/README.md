# a page runs on the server and can read data
Lesson: the function in `page.tsx` does not run in the browser. It runs on the server — the `npm run dev` program —
each time someone asks for the page, and the browser only receives the finished HTML. So a page may do things a
browser never could: read a file from disk, ask a database. This app has a helper for that: `getProducts()` in
`src/lib/products.ts` reads `data/products.json` and returns the list of products. Import it at the top of the file:
    import { getProducts } from "@/lib/products";
`@/` means "the src folder". Then, inside the function before `return`: `const products = getProducts();`
`products` is a list (an array): `products.length` is how many, `products[0]` the first one, `products[0].name` its name.
Try it: open `src/lib/products.ts` and `data/products.json` — the function reads that file.
Your task: in `src/app/hello/page.tsx` import `getProducts`, call it inside the page function, and add
`<p data-testid="catalogue">{products.length} products, first: {products[0].name}</p>` to the section.
The page shows `3 products, first: Regenwurm Classic`. (`data-testid` is a label for the checker; it shows nothing.)
App: ~/.k8s-wargame/nextjs/app — `cd` there (or `wg shell`). Editor: any (VS Code: `code ~/.k8s-wargame/nextjs/app`). Keep `npm run dev` in one terminal, work in a second. Every level resets the app and stops the server: run `npm run dev` again after `wg next`.
Check yourself:  wg check      stuck?  wg hint
