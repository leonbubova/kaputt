## 1
Only the text between the two quotes after `message:` is the result. Change `world` to `trigger`, save, `npx tsc --noEmit`.
## 2
Keep `id: "hello"` and the `return { message: "…" }` shape — `wg check` runs the task and reads what `run` returns. A red `error TS…` line from tsc means a quote, comma or bracket went missing.
## 3
```ts
export const hello = task({
  id: "hello",
  run: async () => {
    return { message: "hello, trigger" };
  },
});
```
in `src/trigger/hello.ts`.
