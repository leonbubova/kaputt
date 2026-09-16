## 1
Retry options live next to `id` in the task definition: `retry: { ... }`. The shape is the same as `retries.default` in `trigger.config.ts`.
## 2
Fields: `maxAttempts`, `minTimeoutInMs`, `maxTimeoutInMs`, `factor`, `randomize`. Times are milliseconds.
## 3
`retry: { maxAttempts: 5, minTimeoutInMs: 2000, maxTimeoutInMs: 30000, factor: 2, randomize: true }` in `src/trigger/sync-crm.ts`.
