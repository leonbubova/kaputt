## 1
Webhooks are at-least-once. The trigger call needs something that makes the *second* delivery a no-op: look at the options `trigger()` accepts.
## 2
`idempotencyKey` — same key, same run (Trigger.dev returns the existing run). The Stripe event id is the natural key.
## 3
`import { idempotencyKeys } from "@trigger.dev/sdk"` and pass `{ idempotencyKey: await idempotencyKeys.create(event.id, { scope: "global" }) }` as second argument to `chargeCard.trigger(...)`.
