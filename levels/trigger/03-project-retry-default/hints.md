## 1
Project-wide defaults live in `trigger.config.ts` inside `defineConfig({...})` — next to `maxDuration` and `dirs`. Anything set there applies to every task that doesn't override it.
## 2
The key is `retries: { default: { ... } }` with `maxAttempts`, `minTimeoutInMs`, `maxTimeoutInMs`, `factor`, `randomize`. Times are milliseconds. `enabledInDev: true` next to `default` makes retries also happen under `trigger.dev dev`.
## 3
```ts
retries: { enabledInDev: true, default: { maxAttempts: 3, minTimeoutInMs: 1000, maxTimeoutInMs: 10000, factor: 2, randomize: true } },
```
