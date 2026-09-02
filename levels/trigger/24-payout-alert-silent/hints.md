## 1
The type checker already knows the shape the SDK calls hooks with — a hook that fails `tsc` is one being called with arguments it wasn't written for, and `Cannot destructure … of 'undefined'` is what that looks like at runtime. Run `npx tsc --noEmit`. The error points at the `onFailure` hook in `src/trigger/payout.ts`.
## 2
v3 hooks were `(payload, error, { ctx })`. v4 hooks take **one object**: `({ payload, error, ctx })`. At runtime the old signature gets the object as `payload`, `undefined` as error and crashes on the third argument.
## 3
`onFailure: async ({ payload, error, ctx }) => { ... }` — types are inferred, drop the manual annotations.
