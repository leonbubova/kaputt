# dev.to / Hashnode draft (ticket #7)

> DRAFT — do not post before the browser demo (#33) is live.
> Placeholders: `NAME` (currently kaputt, will be kata.sh), `PLAY_URL` (browser demo),
> `REPO_URL` = https://github.com/leonbubova/kaputt, `SITE_URL` = https://leonbubova.github.io/kaputt/
> Suggested tags: devops, bash, kubernetes, learning. Cover image: terminal screenshot of `wg level 8` → `wg check` green.

---

# I built a break/fix wargame with a ~140-line bash CLI — the design

NAME is a wargame for infrastructure tools. Each level brings up a real environment, breaks one thing, and hands you the incident. You fix it with the tools you already use; a checker verifies the system genuinely works again. It currently covers 18 tracks and 294 levels — Kubernetes, Docker, Helm, Linux, git, bash, Postgres, Redis, nginx, networking, systemd, Terraform, TLS, Supabase, NestJS, Next.js, Trigger.dev, and a defensive web-security track.

This post is about how it is built, and why the design ended up as small as it did.

## The problem with tutorials

A tutorial hands you the command and asks you to type it. That trains copying. The skill that matters in an incident is retrieval under uncertainty: the pod is in `CrashLoopBackOff`, nobody tells you why, and you decide what to look at first. You build that by being handed broken systems repeatedly, with feedback on whether the fix actually worked.

Wargames have done this for security for decades (OverTheWire's Bandit is the obvious model). For operations tooling the format is rare, mostly because the environments are heavier: a Kubernetes level needs a cluster, and it has to reset cheaply between attempts.

## The core loop

```
wg track k8s      # pick a discipline
wg start          # bring the environment up
wg level 8        # something is now broken
kubectl get pods  # your job: find it and fix it
wg check          # exit 0 → solved, scored
wg hint           # three per level, counted
```

`wg level N` resets the play area, runs the level's sabotage, and prints the ticket. `wg check` runs the level's checker. Everything in between is the player's normal terminal. The game never wraps `kubectl` or `psql`; there is nothing to learn about the game itself.

## Three layers

Three concerns, each changeable without touching the others.

### 1. The CLI knows only tracks and levels

`bin/wg` is 136 lines of bash. It has no idea what Kubernetes or Docker are. It knows that a track is a directory under `levels/`, that a level is a numbered subdirectory, and that state lives in plain files under `~/.k8s-wargame/`. Loading a level is this:

```bash
load_level() { # N
  need_env; local d; d=$(level_dir "$1") || true; [ -n "$d" ] || { echo "no level $1 in $TRACK"; exit 1; }
  local prev; prev=$(cat "$STATE/$TRACK.current" 2>/dev/null || true)
  [ -n "$prev" ] && [ -f "$TDIR/$prev/clean.sh" ] && (cd "$TDIR/$prev" && bash clean.sh >/dev/null 2>&1 || true)
  local l; l=$(basename "$d"); echo "loading $TRACK/${l}…"; track_wipe
  (cd "$d" && bash break.sh)
  echo "$l" > "$STATE/$TRACK.current"; date +%s > "$STATE/$TRACK.$l.start"; : > "$STATE/$TRACK.$l.hints"
  cat "$d/README.md"
}
```

Previous level's cleanup, wipe, break, record the start time, print the ticket. Checking is symmetrical:

```bash
cmd_check() {
  need_env; local l; l=$(cur)
  if (cd "$TDIR/$l" && bash check.sh); then
    s=$(( $(date +%s) - $(cat "$STATE/$TRACK.$l.start") ))
    h=$(wc -l < "$STATE/$TRACK.$l.hints" | tr -d ' ')
    echo "$TRACK/$l solved ${s}s hints=$h" >> "$STATE/progress"
  else echo "not yet."; exit 1; fi
}
```

The scoreboard is one line per solved level in a text file. `rm -rf ~/.k8s-wargame` is a fresh player. No database, no daemon, nothing to migrate when levels change.

### 2. A track is a folder with four functions

A track is `levels/<name>/track.sh`, sourced by the CLI. It must define four functions:

| function | contract |
|---|---|
| `track_start` | bring the environment up; idempotent |
| `track_stop` | tear it down |
| `track_ready` | exit 0 if the environment is usable |
| `track_wipe` | reset the play area before each level; fast |

That is the entire plugin interface. The git track is the smallest example:

```bash
WGGIT=${WG_GIT_DIR:-$HOME/.k8s-wargame/git}
track_start() { command -v git >/dev/null || { echo "git missing" >&2; return 1; }; mkdir -p "$WGGIT"; }
track_stop()  { rm -rf "$WGGIT"; }
track_ready() { command -v git >/dev/null; }
track_wipe()  { rm -rf "$WGGIT"; mkdir -p "$WGGIT"; }
```

The Kubernetes track implements the same four functions against a k3d cluster: `track_start` creates a one-server, two-agent cluster and pre-pulls the handful of images levels use; `track_wipe` deletes and recreates the `wg` namespace. The Postgres track runs one container and its wipe is `DROP DATABASE ... WITH (FORCE); CREATE DATABASE`. The systemd track has no container at all — systemd has to be PID 1, so the four functions run over ssh against a real Linux host and the wipe removes every `wg-*` unit.

Because the interface is that narrow, tracks were built in parallel against a one-page spec. The CLI did not change when the count went from one track to eighteen.

### 3. A level is break.sh + check.sh

A level is a directory `levels/<track>/NN-slug/` containing a ticket (`README.md`), the sabotage (`break.sh`), the judge (`check.sh`), three escalating hints, and a reference solution. Here is the Kubernetes crashloop level in full. The ticket:

> **the api pod keeps restarting**
> Team says: "we deployed `api` to namespace `wg` 10 minutes ago and it's been flapping ever since."
> Goal: `api` deployment has 1 ready pod that stays up. Don't change the image.

The sabotage applies a deployment whose container refuses to start without `DB_HOST` — and sets `DB_HOTS` instead:

```bash
source ../../../lib/common.sh
$K apply -f - <<'Y'
apiVersion: apps/v1
kind: Deployment
metadata: {name: api, labels: {app: api}}
spec:
  replicas: 1
  selector: {matchLabels: {app: api}}
  template:
    metadata: {labels: {app: api}}
    spec:
      containers:
      - name: api
        image: busybox:1.36
        command: ["sh","-c","[ -n \"$DB_HOST\" ] || { echo \"FATAL: DB_HOST is not set\"; exit 1; }; sleep infinity"]
        env:
        - {name: DB_HOTS, value: postgres.wg.svc}
Y
```

The checker:

```bash
source ../../../lib/common.sh
wait_available api 1 60 || fail "api has no available replica"
img=$($K get deploy api -o jsonpath='{.spec.template.spec.containers[0].image}')
[ "$img" = busybox:1.36 ] || fail "image was changed ($img)"
stable_for app=api 10 || fail "still restarting"
ok "api is up and stable"
```

The level rules fit on a page: symptom first, never name the cause in the ticket; one realistic root cause; every track opens with a "build it" block before the incidents; the last levels chain two faults.

## Outcome-based checking

The checker above never reads the player's shell history or diffs the manifest. It asks the API server three questions: is there an available replica, is the image the one the ticket said not to touch, and did the restart counter stay flat for ten seconds. Whether the player used `kubectl edit`, `kubectl set env`, or rewrote the manifest is irrelevant. That is the rule for every level: verify from the outside, guard the constraints the story imposes, and nothing else.

A few tracks needed extra care to keep that promise:

- **git.** "Fix the last commit message" must not be solvable by making a new commit. `break.sh` records the parent hash and the tree hash into a file; `check.sh` compares them, then checks the message, the commit count, and that the working tree is clean.
- **pentest.** The player is editing a running Node app. The checker copies the app to a scratch directory and starts its own instance on a different port, so it judges the code as written, not whatever process happens to be running.
- **postgres.** "Fix the seed script so it loads" is checked by replaying the player's `seed.sql` into a freshly created scratch database, in addition to counting rows in the real one. Deleting the foreign key to make the seed load is caught separately.

There is no leaderboard and `wg spoil` prints the solution on request, so this is not anti-cheat in the competitive sense. A passing check has to mean the player made the right fix, because that is the only feedback the game gives.

## The test harness: break → must fail → fix → must pass

Every level ships a reference fix in the track's `solutions.sh`. The harness is thirteen lines:

```bash
for d in "$ROOT"/levels/$T/[0-9]*; do n=$(basename "$d" | cut -c1-2)
  $WG level "$((10#$n))" >/dev/null || { r "$n BREAK-FAILED"; continue; }
  if WG_FAST=1 $WG check >/dev/null 2>&1; then r "$n CHECK-PASSES-BEFORE-FIX"; continue; fi
  "s$n" >/dev/null 2>&1 || { r "$n SOLUTION-ERRORED"; continue; }
  if $WG check >/dev/null 2>&1; then r "$n ok"; else r "$n CHECK-FAILS-AFTER-FIX"; fi
done
```

Four ways to fail, each a different bug class. `CHECK-PASSES-BEFORE-FIX`: the sabotage did not break hard enough, or the checker is too lenient. `CHECK-FAILS-AFTER-FIX`: the checker is wrong, or the environment is not what the level assumed. `WG_FAST=1` shortens every wait in the shared helpers to about six seconds, so the "must fail" probe does not sit through a sixty-second timeout per level.

It is slow, because it runs against a real cluster. That is the point. The first run on the Kubernetes track found seven real bugs: checks that raced the cluster, a level that did not break hard enough, a base image that had vanished from Docker Hub. Three later ones would not have surfaced any other way:

**A Helm release leaking across tracks.** The last Kubernetes level installs a Helm release and breaks an upgrade. Nothing removes that release when you switch tracks — a wipe only runs when the next level of the same track loads. The Helm track shares the cluster in another namespace, and one of its checkers listed releases across namespaces and found the stray one. The fix was on both sides: a `clean.sh` on the Kubernetes level that uninstalls its release, and the Helm check scoped to its own namespace. Testing either track alone would have passed.

**`DROP DATABASE` inside a transaction.** One Postgres level's checker reset the database with `DROP DATABASE …; CREATE DATABASE …` passed to `psql` as a single `-c` string. psql wraps a multi-statement `-c` in one transaction, and Postgres refuses `DROP DATABASE` inside a transaction block — so the checker errored before it ever judged the player's fix. Splitting it into two `psql -c` calls fixed it. The harness caught it on the first run; a test of the checker's logic alone could not have, because the bug was in how the reset was issued, not in what it verified.

**systemd garbage-collecting its own timestamps.** The first systemd level asks for a `Type=oneshot` unit that runs once. The original check proved it had run by reading the unit's runtime timestamps via `systemctl show`. A finished oneshot without `RemainAfterExit` is garbage-collected, and its timestamps go with it — so the correct fix failed the check. The unit now writes a marker file and the check reads that.

CI runs the harness on the two tracks that need no Docker; the container tracks are gated locally before merge.

## The browser playground

Asking someone to install k3d before they can see whether the game is any good is a hard sell. The playground is a web terminal that gives each visitor a throwaway container running the real `wg` CLI, with only the two Docker-free tracks (git and bash) inside.

The whole server side is `ttyd` spawning one container per connection:

```bash
exec ttyd -p "$PORT" -i "$BIND" -m "$MAX" -W \
  timeout "$TTL" docker run --rm -i -t \
    --network=none --memory=128m --memory-swap=128m --cpus=0.5 --pids-limit=64 \
    --cap-drop=ALL --security-opt=no-new-privileges --read-only \
    --tmpfs /home/player:rw,exec,size=64m,uid=1000,gid=1000 --tmpfs /tmp:rw,size=32m \
    "$IMG"
```

No network, 128 MB of memory, half a CPU, 64 processes, no capabilities, read-only root filesystem, a 64 MB tmpfs home that dies with the session, and a 45-minute ceiling. The image is Debian slim plus git, bash, and the game directory, owned by root and read-only to the player.

This is cheap because the two tracks in it need nothing but a filesystem: a git level is `git init` and a few commits, a bash level is a script in a sandbox directory. The default cap is twenty concurrent sessions, about 2.5 GB of memory at the limit. It is responsive because there is no provisioning step — a session is a plain `docker run` of a slim image. The trust boundary is `ttyd` itself, since it holds Docker access; it binds to loopback and sits behind a reverse proxy with TLS and rate limiting. Heavier tracks are deliberately not in this tier.

## What is next

**Multiplayer isolation.** Today the game is single-player, one environment per machine. The CLI already scopes all state per player via `WG_PLAYER`, but the environments are not isolated: two players on one host would fight over the same namespace or container. The plan is per-player play areas in `track_wipe` (namespace or container prefix), so a team can share one host.

**A hosted tier for the heavy tracks.** The playground pattern extends to anything that fits in a container, but Kubernetes and Supabase levels do not. A hosted tier would give each session a small cluster on demand — worth building only if people want the Kubernetes track badly enough to wait for one.

**More tracks.** The plugin interface makes a new track a weekend's work. Which ones people want is the open question.

---

Try it in the browser: PLAY_URL
Source and every level: REPO_URL
Track list and site: SITE_URL
