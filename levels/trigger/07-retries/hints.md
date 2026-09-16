## 1
Options for a task go inside the same `{ … }` as `id` and `run`, each on its own line ending with a comma. `retry` is one of them.
## 2
`retry: { maxAttempts: 4 },` on the line after `id: "ping-crm",`. Do not touch `run` or `src/lib/crm.ts`.
## 3
```ts
export const pingCrm = task({
  id: "ping-crm",
  retry: { maxAttempts: 4 },
  run: async () => {
    return await crmUpsert({ id: "usr_1", email: "ana@example.com" });
  },
});
```
in `src/trigger/ping-crm.ts`.
