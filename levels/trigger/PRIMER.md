# trigger — the commands & files you'll actually use
App: ~/.k8s-wargame/trigger/app (`wg shell`). Trigger.dev v4 task code, no cloud: you edit files, `wg check` type-checks and runs the tasks in the SDK's own mock context.

  npx tsc --noEmit                   your local feedback loop — run it after every edit
  grep -rn maxDuration trigger.config.ts src/trigger    where is a setting set — project level or task level?
  trigger.config.ts                  project defaults: dirs (where the CLI looks for tasks), maxDuration (SECONDS), retries.default
  src/trigger/<name>.ts              one task per file: `export const x = task({ id: "x", run: async (payload) => … })`
  schemaTask({ id, schema: z.object({…}), run })    validated payload — bad payloads are rejected at trigger time
  schedules.task({ id, cron: { pattern, timezone }, run })    cron task; a bare cron string runs in UTC
  retry / maxDuration / machine / queue    task options next to `id`; task-level beats project-level
  x.trigger(payload, { idempotencyKey })  /  x.batchTrigger([{ payload }, …])    one run / many runs in ONE call
  await wait.for({ days: 1 })        pause for free (checkpointed); setTimeout burns compute and hits maxDuration
  metadata.set("progress", n)        the only progress the dashboard can see
  onFailure: async ({ payload, error, ctx }) => …    v4 hooks take ONE object (v3 was three arguments)

Mental model: a task is a plain object the CLI indexes from `dirs` — unique `id`, a `run`, options. Everything the platform enforces (retries, duration, concurrency, dedup, schedules) is declared next to the task or at the call site, never coded inside `run`. When something "doesn't happen", ask: is it declared where the platform reads it?
