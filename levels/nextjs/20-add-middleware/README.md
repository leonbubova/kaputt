# redirect old /legacy links
"Old flyers link to `/legacy` and `/legacy/<campaign>`. Those should all land on `/about` with a redirect — don't build pages under `/legacy`. Do it in a middleware, matched only to those paths so nothing else pays for it."
App: `~/.k8s-wargame/nextjs/app`. Goal: `GET /legacy` and `GET /legacy/summer` answer 3xx with `Location: /about`; `src/middleware.ts` has a `matcher`.
