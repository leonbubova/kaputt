## 1
Copy `src/api/reports.ts` to `src/api/orders.ts` and swap the task: import `processOrder` from `../trigger/process-order.js`, name the function `placeOrder`, parameter `orderId: string`.
## 2
`const handle = await processOrder.trigger({ orderId });` — `{ orderId }` is short for `{ orderId: orderId }`. Then `return { runId: handle.id };`.
## 3
```ts
import { processOrder } from "../trigger/process-order.js";

export async function placeOrder(orderId: string) {
  const handle = await processOrder.trigger({ orderId });
  return { runId: handle.id };
}
```
in `src/api/orders.ts`.
