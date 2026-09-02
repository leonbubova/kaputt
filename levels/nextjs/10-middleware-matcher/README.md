# middleware runs before routing, but only on the paths its matcher selects
Lesson: `src/middleware.ts` exports one function that runs before Next.js resolves a request to a page or route. It can redirect, rewrite, add headers, or block. Redirecting old URLs without creating pages for them is its classic job.
It does not run for every request. `export const config = { matcher: [...] }` lists path patterns, and only matching requests enter the middleware at all. Everything else skips it and goes straight to normal routing — where, if no page exists, the answer is a plain 404 with no trace of the middleware. `:path*` matches any number of further segments; a bare `/legacy` matches only that exact path, so both are often needed.
When a redirect "stops working", the first question is not "is the redirect logic right" but "did the request reach the middleware at all".
    src/middleware.ts                 the function + config.matcher
    matcher: ["/x", "/x/:path*"]      exact path plus everything beneath it
    curl -I localhost:3100/legacy     status + Location; 404 = middleware never ran
    NextResponse.redirect(new URL("/about", request.url))
Try it first: `curl -I localhost:3100/legacy/summer`, then `cat src/middleware.ts` and compare the matcher patterns with that path.
Your task: flyers and old newsletters link to `/legacy` and `/legacy/summer`. Those are supposed to redirect to `/about` — the middleware for it exists. Since a refactor they 404. App: `~/.k8s-wargame/nextjs/app`.
Goal: `GET /legacy` and `GET /legacy/anything` answer with a 3xx redirect to `/about`. Don't add pages under `/legacy`.
Check yourself:  wg check      stuck?  wg hint
