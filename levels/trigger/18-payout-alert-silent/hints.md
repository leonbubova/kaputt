## 1
Run `npx tsc --noEmit`. The error points at the `onFailure` hook in `src/trigger/payout.ts`.
## 2
v3 hooks were `(payload, error, { ctx })`. v4 hooks take **one object**: `({ payload, error, ctx })`. At runtime the old signature gets the object as `payload`, `undefined` as error and crashes on the third argument.
## 3
`onFailure: async ({ payload, error, ctx }) => { ... }` — types are inferred, drop the manual annotations.
