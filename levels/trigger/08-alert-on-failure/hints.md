## 1
Tasks accept lifecycle hooks next to `run`: `onStart`, `onSuccess`, `onFailure`, … `onFailure` runs once, after the last failed attempt.
## 2
v4 hooks take a single object: `onFailure: async ({ payload, error, ctx }) => {...}`. `error` is `unknown` — narrow it with `instanceof Error`.
## 3
```ts
onFailure: async ({ payload, error }) => {
  const msg = error instanceof Error ? error.message : String(error);
  await sendAlert(`payout ${payload.orderId} failed: ${msg}`);
},
```
