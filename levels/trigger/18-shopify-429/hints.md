## 1
Concurrency is a property of the **queue** a task runs in. Which queue does `sync-shopify` use? `cat src/trigger/sync-shopify.ts src/trigger/queues.ts`.
## 2
`queue: { name: "shopify" }` creates a *new* queue with no limit. The limited one is `shopify-api`, exported as `shopifyQueue`.
## 3
`import { shopifyQueue } from "./queues.js"` and set `queue: shopifyQueue`.
