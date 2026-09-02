# [slug] folders match any value, and the page reads it from params
Lesson: a folder name in square brackets is a dynamic segment. `src/app/posts/[slug]/page.tsx` serves `/posts/hello-world`, `/posts/zweiter`, `/posts/anything` — one file, every value. The matched part arrives in the page's `params` prop under the name you put in the brackets.
The Next 15 detail that trips people: `params` is a Promise, not a plain object. The page must be an `async` function and `await params` before reading fields. Reading `params.slug` directly still appears to work in `next dev`, but logs a `params should be awaited` warning and fails `npm run build` type-checking — so the build, not the dev server, is the real test.
    src/app/posts/[slug]/page.tsx     dynamic segment; folder name = key in params
    { params }: { params: Promise<{ slug: string }> }   the prop type in Next 15
    const { slug } = await params;    inside an async component
    npm run build                     type-checks; next dev does not
Try it first: `cat 'src/app/products/[slug]/page.tsx'` — an existing dynamic route in this app, already written the Next 15 way. Then `curl -s localhost:3100/products/regenwurm | head`.
Your task: we need `/posts/<anything>` to render a page whose `<h1 data-testid="post-slug">` shows the slug from the URL — e.g. `/posts/hello-world` shows `hello-world`. Must pass `npm run build` on Next 15. App: `~/.k8s-wargame/nextjs/app`.
Goal: `/posts/hello-world` and `/posts/zweiter` render their slug; `npm run build` passes; no `params should be awaited` warning in the dev log.
Check yourself:  wg check      stuck?  wg hint
