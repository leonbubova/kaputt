# tasks trigger tasks: batchTrigger creates many runs in one call
Lesson: a task can start other tasks, exactly like API code does — import the child task object and call a method on it inside `run`. The parent does not wait for the children; it gets handles back and returns.
There are two ways to start N children. `child.trigger(payload)` in a loop is N API calls, N round trips, N chances to fail halfway. `child.batchTrigger([{ payload }, ...])` is ONE call that creates all N runs at once and returns a single `batchId` plus `runCount`. For thousands of users that is minutes versus seconds.
The shape of the batch items is important: each item is an object with a `payload` key, not the bare payload. `map` over your ids, wrap each in `{ payload: {...} }`.
    cat src/api/campaign.ts                              API code doing the same fan-out
    import { notifyUser } from "./notify-user.js"        the child task object (note the .js)
    notifyUser.batchTrigger([{ payload }, ...])          one call, many runs -> { batchId, runCount }
    notifyUser.trigger(payload)                          one call, one run
Try it first: `cat src/trigger/notify-user.ts` — what payload does the child expect?
Your task: "Add task `send-campaign` with payload `{ campaign: string, userIds: string[] }`. It must create one `notify-user` run per user (payload `{ userId, campaign }`) in a **single batch** — not one trigger call per user — and return `{ batchId, count }`." Goal: exactly that.
Check yourself:  wg check      stuck?  wg hint
