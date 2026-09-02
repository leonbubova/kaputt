# a scheduled task declares its cron next to the id, and a timezone next to the cron
Lesson: a schedule is not a loop with a sleep — it is a declaration. `schedules.task({...})` replaces `task()`, takes a `cron` option next to `id`, and the platform creates a run whenever the cron fires. Nothing about timing lives inside `run`.
The payload of a scheduled `run` is built by the platform, not by a caller: `timestamp` (when it was due), `timezone`, `lastTimestamp`, `upcoming`. You read from it; you never pass it.
A bare cron string is evaluated in UTC. "09:00 in Berlin" is 07:00 UTC in summer and 08:00 UTC in winter, so a plain string is wrong for half the year. Pass an object instead: `cron: { pattern, timezone }` — then the platform handles the DST switch.
    schedules.task({ id, cron, run })                    from @trigger.dev/sdk, instead of task()
    cron: "0 9 * * *"                                    5-field cron, runs in UTC
    cron: { pattern: "0 9 * * *", timezone: "Europe/Berlin" }    pinned to a zone
    payload.timestamp.toISOString()                      the due time, as a Date
Try it first: `grep -rn schedules src/trigger` — no scheduled task exists yet, so `cat src/trigger/process-order.ts` for the plain shape you will adapt.
Your task: "Add a scheduled task `daily-digest` that runs every day at 09:00 **Europe/Berlin** (also after the DST switch). It should return `{ ranAt, timezone }` from the schedule payload." Goal: the task is registered with that declarative schedule.
Check yourself:  wg check      stuck?  wg hint
