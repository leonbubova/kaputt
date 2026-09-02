# lifecycle hooks: onFailure runs once, after the last attempt has failed
Lesson: `run` is not the only function a task can have. Next to it you can declare lifecycle hooks — `onStart`, `onSuccess`, `onFailure`, and more — that the platform calls at fixed points in a run's life. They keep side concerns (alerting, cleanup, metrics) out of the business code.
`onFailure` is special because of retries: it does NOT fire on every failed attempt. It fires once, after the final attempt has failed and the run is marked failed for good. That is exactly the moment a human should be paged.
In v4 every hook receives a single object and you destructure what you need: `{ payload, error, ctx }`. `error` is typed `unknown` because anything can be thrown — narrow it with `instanceof Error` before reading `.message`.
    onFailure: async ({ payload, error, ctx }) => {...}    v4: one object argument, next to run
    error instanceof Error ? error.message : String(error)    safe way to get the message
    cat src/lib/alerts.ts                                  what sendAlert expects
Try it first: `cat src/trigger/payout.ts` — see what `run` throws, and that nothing catches it.
Your task: "When a `payout` run fails for good, on-call must get an alert containing the **order id** and the **error message**. Use `sendAlert` from `src/lib/alerts.ts`." Goal: `payout` has a failure hook that does exactly that.
Check yourself:  wg check      stuck?  wg hint
