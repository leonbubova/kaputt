# Track spec — how a track and its levels are built

Repo root = `$WG_ROOT` (bin/wg exports it). Bash 3.2 compatible (macOS): no `${var,,}`, no `local a=1 b=2`, never glue unicode to `$var` (write `${var}…`).

## Layout
```
levels/<track>/track.sh        environment lifecycle (sourced by bin/wg); may set LEARN_LEVELS=N (default: half the track, rounded up)
levels/<track>/solutions.sh    sNN() functions applying the reference fix — test harness only
levels/<track>/NN-slug/
    README.md    # learn level (NN ≤ LEARN_LEVELS): lesson + task, see below. test level: first line "# <symptom as the team would say it>", 2–4 lines: story, goal, constraints
    break.sh     # sabotage; idempotent; sourced with: source "$WG_ROOT/lib/common.sh"
    check.sh     # exit 0 = solved; verifies OUTCOME, not method; must FAIL before fix; honor WG_FAST (short waits)
    hints.md     # "## 1" "## 2" "## 3" — escalate: where to look → what it means → the command
    solution.md  # 1–3 lines root cause + command
    clean.sh     # optional; undo anything outside the wiped area (host state, cluster-scoped objects)
```
`track.sh` must define: `track_start` (idempotent), `track_stop`, `track_ready` (exit 0 if env usable), `track_wipe` (reset the play area before each level, fast), optional `track_shell` (interactive shell into the broken machine).

## Design rules
- **Learn, then test.** The first half of every track (levels 01–LEARN_LEVELS) are *learn levels*: the README teaches the concept first, then gives the task; `wg hint` is free there. The second half are *test levels*: ticket only, hints counted. Break/fix mechanics are identical in both — only the README differs.
- **Learn-level README** (model: `levels/bash/01`, `levels/bash/06`, `levels/shell/*`), 120–250 words, one concept:
  - line 1: `# <the concept in one line>` — what you will be able to do, not a symptom (shown by `wg list` and the site)
  - `Lesson:` the concept in plain words: what it is, why it matters, the mental model. One idea per short paragraph, no walls of text.
  - the 2–5 commands/forms it needs, PRIMER style: 4-space indent, `command   what it does`
  - optional `Try it first:` one tiny, safe experiment that makes the concept visible
  - `Your task:` the thing to build or fix (the old ticket text fits here), then `Goal:` as before
  - last line: `Check yourself:  wg check      stuck?  wg hint`
  - teaches the idea, never the level's specific answer — that stays in `hints.md ## 3` / `solution.md`. Learn levels are usually "build it" tasks (ADD or CREATE something small: `break.sh` removes it, `check.sh` verifies it exists and works) but a teach-first incident is fine.
- **Test-level README**: symptom first, like an incident ticket. Never name the cause. Easy → hard; the last 2–3 levels chain two causes.
- One root cause per level, realistic (typo, wrong name, wrong port, missing permission, resource limit…). Ordered easy → hard; later levels may chain two causes.
- `check.sh` verifies from the outside (curl, exec, query) and guards against cheating shortcuts where the story forbids them (e.g. "don't change the image").
- 12–18 levels. Everything self-contained: no internet at play time beyond pulling small public images. Prefer alpine/busybox/nginx.
- Names prefixed `wg-` for anything created on the host (containers, networks, volumes, dirs) so wipe can `rm`/`docker rm` by prefix.
- All output of break.sh silenced except errors.

## Test
`test/run-all.sh <track> [NN]` — for each level: load → `WG_FAST=1 wg check` must fail → `sNN` → `wg check` must pass. Must end with `ALL GREEN`. Do not edit bin/wg, lib/, or test/ while a run is in progress. Do not touch other tracks. Do not git commit.

## Reference
`levels/k8s/` is the finished example (25 levels: 01–07 build-it, 08–25 incidents). Read 01, 03, 08, 12, 18, 23, 25 and `track.sh` before starting.
