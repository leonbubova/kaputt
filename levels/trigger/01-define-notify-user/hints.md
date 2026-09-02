## 1
A task is an exported object built with `task({ id, run })` from `@trigger.dev/sdk`, one per file under `src/trigger`. The `id` string is how the platform addresses it; `run` is the async function that executes. `cat src/trigger/send-welcome-email.ts` for the shape.
## 2
The payload type is declared on the `run` parameter: `run: async (payload: { userId: string; campaign: string }) => { ... }`. Whatever `run` returns is the run's output.
## 3
```ts
import { task } from "@trigger.dev/sdk"; import { sendEmail } from "../lib/db.js";
export const notifyUser = task({ id: "notify-user",
  run: async (payload: { userId: string; campaign: string }) => {
    await sendEmail(`${payload.userId}@example.com`, payload.campaign); return { notified: payload.userId }; } });
```
