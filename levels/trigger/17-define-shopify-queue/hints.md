## 1
Concurrency is not a task option — it belongs to a **queue**, and tasks are put into queues. A queue is defined once with `queue({...})` from `@trigger.dev/sdk` and exported like a task, so several tasks can share it.
## 2
`queue({ name, concurrencyLimit })` — `name` is what the dashboard shows, `concurrencyLimit` is how many runs of *all* tasks in that queue may execute at once.
## 3
```ts
import { queue } from "@trigger.dev/sdk";
export const shopifyQueue = queue({ name: "shopify-api", concurrencyLimit: 2 });
```
