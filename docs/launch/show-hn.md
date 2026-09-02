# Show HN draft (ticket #4)

> DRAFT — do not post before the browser demo (#33) is live.
> Placeholders: `NAME` (currently kaputt, will be kata.sh), `PLAY_URL` (browser demo),
> `REPO_URL` = https://github.com/leonbubova/kaputt, `SITE_URL` = https://leonbubova.github.io/kaputt/
> Numbers below come from `site/levels.json` (18 tracks, 294 levels) — regenerate with `site/build.sh` and update before posting.

## Title

```
Show HN: NAME – a break/fix wargame for 18 devops tools, in your terminal
```

(75 chars with "kaputt"; 76 with "kata.sh".)

## Body

I built a wargame where every level breaks a real system and you have to fix it.

`wg start` brings up the environment (a k3d cluster, a container, a Postgres, a git repo); `wg level 8` sabotages one thing and prints the incident the way a teammate would report it: "the api pod keeps restarting." You debug with your normal tools — `kubectl`, `docker`, `psql`, `git`. `wg check` verifies the outcome from the outside — does the service answer, is the pod stable, is the history intact — never how you got there.

The architecture is small on purpose. The CLI is ~140 lines of bash and knows only tracks and levels. A track is a folder whose `track.sh` exposes four functions: `track_start`, `track_stop`, `track_ready`, `track_wipe`. A level is `break.sh` + `check.sh` + a ticket, three hints, and a solution. State is plain files in `~/.k8s-wargame/`. The test harness plays every level end-to-end: load it, the check must fail, apply the reference fix, the check must pass.

Today: 18 tracks, 294 levels — k8s, docker, helm, linux, git, bash, postgres, redis, nginx, networking, systemd, terraform, tls, supabase, nestjs, nextjs, trigger.dev, and a defensive pentest track.

Try it in the browser (git and bash tracks, no signup): PLAY_URL
Repo: REPO_URL — Site: SITE_URL

Limits: single-player, one environment per machine. The browser demo has only the two Docker-free tracks; k8s/helm/docker need a local Docker (k3d is ~1.5 GB RAM). I'd like to know which tracks people actually want.

## first-comment

Some things people usually ask:

**Can't you just game the checks?** Checks look at the outcome from outside, not at your commands or your diff. The k8s crashloop level asks the API server whether the deployment has an available replica and whether the restart counter stayed flat for ten seconds; it also asserts the image is unchanged, because the ticket said "don't change the image." The git levels record the expected parent hash and tree hash in `break.sh` and compare them in `check.sh`, so "just make a new commit" fails. The pentest checks copy the app to a scratch directory and start their own instance, so they never touch whatever you're running. The Postgres seed level replays your `seed.sql` into a fresh scratch database. There's no leaderboard and `wg spoil` is one command away — the only person you can cheat is yourself, so the checks are about teaching the right fix, not about anti-cheat.

**Why bash?** The levels are shell anyway (`kubectl apply`, `docker run`, `psql -c`), and the plugin interface is "source a file, call four functions" — that's a bash feature, not something I had to build. No runtime to install, and it runs on macOS's bash 3.2, which is the actual constraint. Everything the CLI does is `mkdir`, `cat`, `grep` on plain files.

**Resource footprint.** git/bash: nothing beyond the tools. Most container tracks: one container, loopback-bound. k8s/helm: a 3-node k3d cluster, ~1–1.5 GB RAM. supabase: the real local stack, ~2 GB. systemd needs a real Linux host over ssh because systemd has to be PID 1. The browser demo runs one container per visitor with `--network=none`, 128 MB, 0.5 CPU, read-only root, tmpfs home, 45-minute timeout.

**The pentest track is defensive.** Each level ships an intentionally vulnerable route (XSS, SQLi, IDOR, path traversal, command injection, prototype pollution); your job is to fix it while keeping the feature working. The app binds to 127.0.0.1 only. The command-injection level is real RCE if you expose it — don't run it on a shared host. Details in SECURITY.md.
