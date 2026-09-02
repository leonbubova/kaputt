# Track `trigger` — Trigger.dev v4 task code, fully offline

## What the player gets
`wg start` copies `template/` (a small shop backend: 13 tasks in `src/trigger`, callers in `src/api`)
to `~/.k8s-wargame/trigger/app` and symlinks a shared `node_modules` (installed once from the
lock file — the only step that needs internet). Each level edits one or two files of that project
to reproduce a real Trigger.dev mistake; the player fixes the code with their editor.
`wg shell` drops you into the app dir.

## How `wg check` judges (harness/harness.ts)
1. `tsc --noEmit` on the project (CI would; `trigger.dev deploy` would not).
2. A vitest spec per level, run against the play area:
   - **indexes the project the way the CLI does** — reads `trigger.config.ts`, resolves `dirs`
     (or auto-detects `trigger/` dirs), imports every task file with the SDK's real
     `StandardResourceCatalog` → task metadata (retry, queue, machine, maxDuration, schedule,
     id collisions, payload schema) exactly as `trigger.dev dev` would see it.
   - **runs task code** with the SDK's own `runInMockTaskContext` (`@trigger.dev/core/v3/test`):
     `ctx`, `metadata`, `wait`, lifecycle hooks are wired; `run()` is invoked directly.
   - **fake Trigger.dev API** (in-process `http` server, `TRIGGER_API_URL` pointed at it) records
     `trigger()`, `batchTrigger()` and `wait.for()` calls incl. idempotency keys, payloads,
     delays — so checks verify outcomes ("one run per Stripe event", "500 items, zero single
     triggers") instead of grepping source.
   Checks guard against shortcuts (e.g. bumping project-wide `maxDuration`/`machine` instead
   of the one task).

## Option chosen: (b) task-code track — not (a) self-hosted Trigger.dev
Researched 2026-09-02 (docs: self-hosting/docker, cli-dev, config-file; SDK 4.5.15 source):
- Self-hosting v4 = 8 containers (webapp, postgres, redis, supervisor, clickhouse, s2-lite,
  docker-socket-proxy, registry), 6 GB + 8 GB RAM recommended, magic-link login read from
  container logs, worker token bootstrap, and **every code change needs either a running
  `trigger.dev dev` session (login profile + long-lived process) or a `deploy` that builds and
  pushes an image to the registry (minutes)**. A `wg check` that triggers a run and reads its
  status within 60 s after *each level's code edit* would depend on that dev process staying
  attached to the right project — fragile, and it would put the whole judge behind a network
  service on station44. Not provable within the 2-hour budget, so (a) was rejected.
- The CLI has no offline/dry-run mode: every command (`dev`, `deploy`, `list`) requires a
  logged-in profile and a reachable API. Verified in docs (`cli-dev`) — no `--dry-run` exists.
- The SDK ships its own test harness (`runInMockTaskContext`, `StandardResourceCatalog`), which
  makes (b) faithful: the same code paths that register and execute tasks in production run here.
Consequence: levels cover code/config mistakes (discovery, ids, schemas, retries, maxDuration,
machine, queues, schedules, idempotency, batching, triggerAndWait misuse, wait.for, metadata,
v3→v4 hook signatures). Not covered: dashboard/UI, deployment pipeline, realtime streams.

## Levels
Build (01–05): define `charge-card` with schema · retry policy on `sync-crm` · `daily-digest` cron in
Europe/Berlin · `send-campaign` fan-out via batchTrigger · `onFailure` alert on `payout`.
Debug (06–18): dirs misconfigured → no tasks found · duplicate task id · schemaTask payload rejected ·
task-level retry set to 1 · maxDuration seconds vs minutes · OOM → machine preset · wrong queue → no
concurrency limit · webhook without idempotency key · loop of trigger() → batchTrigger · triggerAndWait
outside a task · setTimeout instead of wait.for · metadata never updated · v3 onFailure signature in v4.

## Test
`test/run-all.sh trigger` — ~2.5 min, ALL GREEN on 2026-09-02 (node 25, @trigger.dev/sdk 4.5.15).
