The task references an inline queue `shopify` (unlimited) instead of the shared `shopifyQueue` (`shopify-api`, limit 2).
    # src/trigger/sync-shopify.ts:  import { shopifyQueue } from "./queues.js";  queue: shopifyQueue,
