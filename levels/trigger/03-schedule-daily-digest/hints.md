## 1
Scheduled tasks use `schedules.task({...})` from `@trigger.dev/sdk` instead of `task()`. The `run` payload has `timestamp`, `timezone`, `lastTimestamp`, `upcoming`.
## 2
A plain `cron: "0 9 * * *"` runs in UTC. To pin a timezone pass an object: `cron: { pattern, timezone }`.
## 3
```ts
import { schedules } from "@trigger.dev/sdk";
export const dailyDigest = schedules.task({ id: "daily-digest", cron: { pattern: "0 9 * * *", timezone: "Europe/Berlin" },
  run: async (payload) => ({ ranAt: payload.timestamp.toISOString(), timezone: payload.timezone }) });
```
