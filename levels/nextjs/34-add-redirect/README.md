# /shop should redirect to /products
"Old bookmarks point at `/shop`. It should answer with a server-side redirect to `/products` — a page that redirects, not a middleware rule and not a `next.config` entry."
App: `~/.k8s-wargame/nextjs/app`. Goal: `curl -I localhost:3100/shop` shows a 3xx with `Location: /products`.
