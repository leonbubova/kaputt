# Track spec — how a track and its levels are built

Repo root = `$WG_ROOT` (bin/wg exports it). Bash 3.2 compatible (macOS): no `${var,,}`, no `local a=1 b=2`, never glue unicode to `$var` (write `${var}…`).

## Layout
```
levels/<track>/track.sh        environment lifecycle (sourced by bin/wg)
levels/<track>/solutions.sh    sNN() functions applying the reference fix — test harness only
levels/<track>/NN-slug/
    README.md    # first line "# <symptom as the team would say it>", 2–4 lines: story, goal, constraints
    break.sh     # sabotage; idempotent; sourced with: source "$WG_ROOT/lib/common.sh"
    check.sh     # exit 0 = solved; verifies OUTCOME, not method; must FAIL before fix; honor WG_FAST (short waits)
    hints.md     # "## 1" "## 2" "## 3" — escalate: where to look → what it means → the command
    solution.md  # 1–3 lines root cause + command
    clean.sh     # optional; undo anything outside the wiped area (host state, cluster-scoped objects)
```
`track.sh` must define: `track_start` (idempotent), `track_stop`, `track_ready` (exit 0 if env usable), `track_wipe` (reset the play area before each level, fast), optional `track_shell` (interactive shell into the broken machine).

## Design rules
- **Beginner → pro.** Every track opens with a "build it" block (levels 01–0N, ~⅓ of the track): the ticket asks to ADD or CREATE something small (a manifest, a route, a config), `break.sh` removes it from the template/env, `check.sh` verifies it exists and works. Hints there teach the concept and the command, not debugging. Then the incident levels, easy → hard. The last 2–3 levels chain two causes.
- Symptom first, like an incident ticket. Never name the cause in README.
- **One new thing per level, practised before it is needed.** The ticket is the only input a player gets; hints are the fallback, not the curriculum. A level may only require commands and concepts that an earlier level of the same track already made the player use (or that `PRIMER.md` lists). If a ticket needs something new, add a smaller build-it level in front of it that practises exactly that one thing. Many small steps beat one big one.
- One root cause per level, realistic (typo, wrong name, wrong port, missing permission, resource limit…). Ordered easy → hard; later levels may chain two causes.
- `check.sh` verifies from the outside (curl, exec, query) and guards against cheating shortcuts where the story forbids them (e.g. "don't change the image").
- 12–18 levels. Everything self-contained: no internet at play time beyond pulling small public images. Prefer alpine/busybox/nginx.
- Names prefixed `wg-` for anything created on the host (containers, networks, volumes, dirs) so wipe can `rm`/`docker rm` by prefix.
- All output of break.sh silenced except errors.

## Test
`test/run-all.sh <track> [NN]` — for each level: load → `WG_FAST=1 wg check` must fail → `sNN` → `wg check` must pass. Must end with `ALL GREEN`. Do not edit bin/wg, lib/, or test/ while a run is in progress. Do not touch other tracks. Do not git commit.

## Reference
`levels/k8s/` is the finished example (25 levels: 01–07 build-it, 08–25 incidents). Read 01, 03, 08, 12, 18, 23, 25 and `track.sh` before starting.
