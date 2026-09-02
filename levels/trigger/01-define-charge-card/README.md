# a task is an exported object: an id, a run function, and a validated payload
Lesson: a task is a plain object you export from a file under `src/trigger`. The CLI scans those files and registers every `task({...})` under its `id`. The `id` is the address the platform uses; the export name is only for your imports.
`run` is the code that executes, and its argument is the payload the caller passed to `trigger()`. With plain `task()` the payload is whatever TypeScript type you write — nothing checks it at runtime.
`schemaTask` adds a zod `schema`. The payload type of `run` is inferred from it, and a bad payload is rejected when someone calls `trigger()` — before a run even exists. "amount must be a positive integer" belongs there: at the door, not inside the business logic.
    cat src/trigger/process-order.ts                       a sibling task: the shape to copy
    schemaTask({ id, schema: z.object({...}), run })      validated payload, type inferred
    z.number().int().positive()                            zod: a positive integer
    npx tsc --noEmit                                       does the project compile?
Try it first: `npx tsc --noEmit` — read which files import the missing module.
Your task: "`src/api/checkout.ts` and `src/api/stripe-webhook.ts` already import `chargeCard` from `src/trigger/charge-card.ts` — the file doesn't exist yet, `tsc` is red." Goal: create task id `charge-card` with a zod payload schema `{ orderId: string, amountCents: positive integer }` (bad payloads must be rejected at trigger time); `run` records the charge via `charges.push(...)` from `src/lib/db.ts` and returns `{ charged: amountCents, orderId }`.
Check yourself:  wg check      stuck?  wg hint
