## 1
On the server, Next.js can cache the *result* of a `fetch` (the Data Cache) independently of the source — a cached response is served until it is revalidated or the process restarts. That's how the API can be live while the page is stale. Confirm: edit `data/stock.json`, then `curl localhost:3100/api/stock` (fresh) vs `curl -s localhost:3100/stock | grep tauwurm` (stale). The API is fine; the page's data loading is the problem.
## 2
Look at the `fetch(...)` call in `src/app/stock/page.tsx` and its second argument. `force-cache` stores the response in the Data Cache indefinitely — across requests, even in dev.
## 3
Use `{ cache: "no-store" }` (or drop the option — uncached is the Next 15 default), or mark the route `export const dynamic = "force-dynamic"`.
