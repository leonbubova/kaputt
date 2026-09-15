# old marketing links 404
"Flyers and old newsletters link to `/legacy` and `/legacy/summer`. Those are supposed to redirect to `/about` — the middleware for it exists. Since a refactor they 404."
App: `~/.k8s-wargame/nextjs/app`. Goal: `GET /legacy` and `GET /legacy/anything` answer with a 3xx redirect to `/about`. Don't add pages under `/legacy`.
