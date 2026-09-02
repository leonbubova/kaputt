# add /posts/[slug]
"We need `/posts/<anything>` to render a page whose `<h1 data-testid="post-slug">` shows the slug from the URL — e.g. `/posts/hello-world` shows `hello-world`. Must pass `npm run build` on Next 15."
App: `~/.k8s-wargame/nextjs/app`. Goal: `/posts/hello-world` and `/posts/zweiter` render their slug; `npm run build` passes; no `params should be awaited` warning in the dev log.
