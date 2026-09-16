# start a run from normal code: .trigger()
Lesson: so far `wg check` ran your tasks for you. In a real app, your backend starts them. Every task object
has a `trigger` method: calling it does not run the code in your app — it sends one message to Trigger.dev
("run this task with this payload") and comes back at once with a handle. The run happens elsewhere, later.
    import { processOrder } from "../trigger/process-order.js";

    const handle = await processOrder.trigger({ orderId: "ord_1001" });
    handle.id   // the run id, text like "run_…" — keep it to look the run up later
The payload you pass is the payload `run` will receive. `await` is needed: sending the message takes a moment.
Files under `src/api/` are the backend side of this project — they import tasks from `../trigger/`.
Try it — read one that already does this:
    cat ~/.k8s-wargame/trigger/app/src/api/reports.ts
Your task: create `src/api/orders.ts` exporting `async function placeOrder(orderId: string)` that triggers
`process-order` with payload `{ orderId }` and returns `{ runId: handle.id }`.
File: ~/.k8s-wargame/trigger/app/src/api/orders.ts — a new file. Then `npx tsc --noEmit` in ~/.k8s-wargame/trigger/app.
Check yourself:  wg check      stuck?  wg hint
