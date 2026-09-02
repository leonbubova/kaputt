# retries are declared on the task, and a task-level option beats the project default
Lesson: a task never retries itself — no try/catch loops inside `run`. When `run` throws, the platform decides whether to start another attempt, and it decides from configuration that lives in two places.
`trigger.config.ts` holds the project default under `retries.default`: every task inherits it. A task that needs something else declares its own `retry: {...}` block next to `id`. The task-level block wins for that task and leaves everyone else on the default.
The shape is the same in both places: `maxAttempts` (total attempts, including the first), `minTimeoutInMs` (wait before attempt 2), `maxTimeoutInMs` (cap), `factor` (multiplier per attempt, 2 = exponential), `randomize` (jitter). All times are milliseconds — 2 s is `2000`.
    cat trigger.config.ts                          the project default under retries.default
    retry: { maxAttempts, minTimeoutInMs, ... }    same shape, placed next to id in the task
    npx tsc --noEmit                               the option names are type-checked
Try it first: `grep -rn retry trigger.config.ts src/trigger` — which tasks currently override the default? None yet.
Your task: "The CRM API times out on the first calls after a cold start. `sync-crm` should retry up to **5 attempts** with exponential backoff starting at **2 s** and capped at **30 s**. The project default (3 attempts, 1 s) stays as it is for everyone else." Goal: exactly that, on the task.
Check yourself:  wg check      stuck?  wg hint
