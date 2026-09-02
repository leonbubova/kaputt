# Architecture — what was built and why

## The idea
A wargame is three things: an **environment** that can be broken and reset cheaply, a set of
**levels** that each break one thing and can verify it is fixed, and a thin **CLI** that loads
levels, judges, and keeps score. Nothing else. The player uses their normal tools (`kubectl`,
`docker`, `bash`, `psql`) — the game never wraps them.

```
 you ── kubectl / docker / bash ──▶ environment (k3d cluster, container, compose, supabase)
  │                                       ▲          ▲
  └── wg level N ── break.sh ─────────────┘          │
  └── wg check ─── check.sh ─────────────────────────┘   exit 0 → solved, scored
```

## Layers

### 1. `bin/wg` — the CLI (bash, ~120 lines)
- Knows nothing about Kubernetes or Docker. It knows **tracks** and **levels**.
- A track = a directory `levels/<track>/` with a `track.sh` that provides four functions:
  `track_start`, `track_stop`, `track_ready`, `track_wipe` (+ optional `track_shell`).
  `wg` sources that file and calls those functions. That is the whole plugin interface.
- A level = a directory `levels/<track>/NN-slug/` with `break.sh`, `check.sh`, `README.md`,
  `hints.md`, `solution.md`, optional `clean.sh`.
- `wg level N` = run previous level's `clean.sh` → `track_wipe` → run `break.sh` → print README,
  record start timestamp.
- `wg check` = run `check.sh`; exit 0 → write a line to `~/.k8s-wargame/progress`
  (`track/level solved 42s hints=1`), else "not yet".
- `wg hint` = print the Nth `## ` section of `hints.md`, count it. `wg spoil` = print solution, flag it.
- State is plain files in `~/.k8s-wargame/` (current track, current level, start time, hint count).
  No database, no daemon. `rm -rf ~/.k8s-wargame` = fresh player.

### 2. `lib/common.sh` — helpers shared by level scripts
`ok`/`fail`, `wait_available deploy N timeout`, `in_cluster_get URL` (curl from a throwaway busybox
pod), `stable_for selector seconds` (restart counter unchanged). `WG_FAST=1` shrinks every wait to
~6 s; only the test harness sets it, for the "must fail before the fix" probe.

### 3. Tracks (environments)
| track | environment | reset (`track_wipe`) | why this environment |
|---|---|---|---|
| k8s | k3d cluster `wargame`: 1 server + 2 agents, port 8080→ingress | delete + recreate namespace `wg` | multi-node in ~1 GB RAM, disposable, identical on Mac and Linux |
| helm | same k3d cluster, namespace `wg-helm` | uninstall releases + recreate ns | helm needs a real API server; reuse the cluster |
| linux | one container `wg-linux` from a pre-built image | recreate container (~2 s) | a "machine" to ssh into, without a VM |
| docker | the host Docker daemon, everything prefixed `wg-` | `compose down -v`, rm by prefix | the subject *is* the daemon |
| supabase | `supabase start` local stack (12 containers) | `db reset` / wipe.sql | the real thing, locally; heavy, so station44 |
| nestjs | NestJS 11 app in `~/.k8s-wargame/nestjs/app`, shared `node_modules` installed once | rm + copy template (~0.1 s), kill port 3200 | the subject is the framework wiring; no container needed, checks boot the app on 3299 |

### 4. Levels
Each `break.sh` applies a manifest / runs commands that produce a realistic, single-cause failure
(typo in a label, wrong port, missing binding…). `check.sh` looks at the **outcome from the outside**
(does the service answer? is the pod stable? can the ServiceAccount list pods?), never at how you
did it, and guards the story's constraints ("don't change the image").
Hints escalate: where to look → what the symptom means → the command.

### 5. `test/run-all.sh` — the contract
For every level: load → `WG_FAST=1 wg check` **must fail** → apply `sNN` from `solutions.sh` →
`wg check` **must pass**. This caught 7 real bugs on day one (checks that raced the cluster, a
level that didn't break hard enough, an image that vanished from Docker Hub). It is slow because it
runs on a real cluster — that is the point; it is not a unit test.

## Setup steps that were done (2026-09-02)
1. Mac: `brew install k3d helm` (Docker via colima already present). `k3d cluster create wargame …`.
2. Wrote CLI, 18 k8s levels, harness; ran the harness until ALL GREEN.
3. station44 (Ubuntu 24.04, 62 GB RAM, `leon` has passwordless sudo):
   `install.sh` → `get.docker.com` installs Docker CE and adds `leon` to group `docker`;
   kubectl from `dl.k8s.io`; k3d from its install script; helm from its install script;
   PATH line appended to `~/.bashrc`/`~/.zshrc`.
4. `wg start` on station44 → cluster up, images pre-pulled, level 1 loaded.
5. Refactor into tracks; four agents built linux / docker / helm / supabase against `docs/track-spec.md`.

## Gotchas learned
- Group membership (`docker`) only applies to new login sessions; same-session use needs `sg docker`/`newgrp`.
- macOS ships bash 3.2: `$var…` glues the unicode to the name; `local a=$(..) b=..` misparses.
- Never edit a bash script while it is running — bash rereads the file by offset.
- `bitnami/kubectl` was removed from Docker Hub; use `bitnamilegacy/kubectl` or `rancher/kubectl` (no shell).
- Deleting a namespace returns before it is gone; wait for it or the next create fails.
- `helm upgrade` without `--wait` reports `deployed` even when the pods never come up.

## Adding a track or level
See `docs/track-spec.md`. Keep `test/run-all.sh <track>` green.
