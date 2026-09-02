# a (group) folder organises files without adding a URL segment
Lesson: folder equals URL segment — with a few naming exceptions, and route groups are the big one. A folder named in parentheses, `(marketing)`, is invisible to the router: `app/(marketing)/pricing/page.tsx` serves `/pricing`, not `/marketing/pricing`. Groups exist so you can split `src/app` into sections, or give each section its own `layout.tsx`, without changing any URL.
The flip side: wrapping an existing folder in parentheses deletes its segment from every URL beneath it. The files stay where they are, the build passes, the dev server is silent, and the routes have moved. `(products)/page.tsx` now answers `/` — and collides with the real `app/page.tsx` — while `(products)/[slug]` catches `/anything`.
Whenever a route vanishes, check the folder names on its path for special syntax before anything else.
    find src/app -name 'page.tsx'     every page and its folder path = its URL
    (name)                            route group: no URL segment
    [slug]  /  _folder                dynamic segment / excluded from routing
    curl -I localhost:3100/products   confirm the status
Try it first: `curl -s localhost:3100/ | grep -o 'data-testid="[a-z-]*"'` — the home page may be rendering content that belongs elsewhere.
Your task: someone reorganised `src/app` into 'route groups' for clarity. Now `/products` and `/products/regenwurm` return 404. The files are all still there, the home page works. App: `~/.k8s-wargame/nextjs/app`.
Goal: `/products` lists the products and `/products/regenwurm` shows the price.
Check yourself:  wg check      stuck?  wg hint
