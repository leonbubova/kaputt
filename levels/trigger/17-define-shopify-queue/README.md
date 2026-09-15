# ticket: shared Shopify queue
"Shopify allows 2 concurrent API calls per store. `src/trigger/sync-shopify.ts` already imports `shopifyQueue` from `src/trigger/queues.ts` — the file doesn't exist yet, `tsc` is red." Goal: create that queue, named `shopify-api`, limited to **2** concurrent runs, so `sync-shopify` runs at most 2 at a time.
