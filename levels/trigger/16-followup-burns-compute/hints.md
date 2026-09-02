## 1
You pay for every second a run's process is alive — a `setTimeout` sleep is still a running process, just an idle one, so the waiting is the expensive part, not the mail. `cat src/trigger/send-followup.ts` — what does the run do for 24 hours? A `setTimeout` keeps the process alive and billed.
## 2
Trigger.dev can checkpoint a run and resume it later for free. The SDK primitive is `wait` from `@trigger.dev/sdk`.
## 3
`import { task, wait } from "@trigger.dev/sdk"` and replace the sleep with `await wait.for({ days: 1 });`
