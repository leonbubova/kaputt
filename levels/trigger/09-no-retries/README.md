# a task-level override replaces the project default — find which layer is in effect
Lesson: settings in Trigger.dev stack in two layers: `trigger.config.ts` holds the project default, a task can override it next to its `id`. You built such an override in level 02. The part that bites later: an override does not merge with the default. A task-level `retry` block replaces the whole default block; whatever it does not set is not inherited, and whatever it sets stands, even when it makes the task worse than the default.
So when a task behaves unlike the rest of the project, the project default is the wrong place to look. Everyone else still gets it. The question is: which layer is in effect for THIS task — and the answer is in the task file, not in the config.
Debugging habit: grep the setting across both layers at once. Two hits mean an override exists, and the task-level one is the one the run obeys.
    grep -rn maxAttempts trigger.config.ts src/trigger     the setting in both layers
    cat trigger.config.ts                                  the default everyone inherits
    cat src/trigger/sync-crm.ts                            what this task declares
Try it first: run the grep — how many places set `maxAttempts`, and which one applies to `sync-crm`?
Your task: "`sync-crm` fails with `CRM API timeout (ETIMEDOUT)` on the very first attempt and never retries — it used to retry 5 times." Goal: `sync-crm` retries again (attempt 3 succeeds). Don't touch the project-wide defaults.
Check yourself:  wg check      stuck?  wg hint
