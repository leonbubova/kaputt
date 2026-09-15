## 1
`schemaTask` validates the payload *when you trigger*, in the caller's process. Read the schema in `src/trigger/charge-card.ts`, then look at what `src/api/checkout.ts` sends.
## 2
Form bodies are strings. `amount_cents: "4999"` is not a `z.number()`. The `any` on the body hides it from `tsc`.
## 3
Convert at the boundary: `amountCents: Number(body.amount_cents)` in `toChargePayload` (or make the schema `z.coerce.number()`).
