## 1
Backend code starts a run by importing the task object and calling a method on it — the SDK turns that into one API call to Trigger.dev and hands back a handle. `cat src/api/reports.ts` does it for `generate-report`.
## 2
`await sendWelcomeEmail.trigger({ userId })` returns `{ id, ... }` — `id` is the run id. It does not wait for the run to finish.
## 3
```ts
import { sendWelcomeEmail } from "../trigger/send-welcome-email.js";
export async function signup(userId: string) { const handle = await sendWelcomeEmail.trigger({ userId }); return { runId: handle.id }; }
```
