# playground — try kaputt in the browser

A web terminal that gives each visitor a throwaway, locked-down container running the real `wg` CLI.
Only the Docker-free tracks (**git**, **bash**) are included — one container per session is cheap.

```
playground/build.sh                       # build the image (from repo root)
PLAYGROUND_BIND=127.0.0.1 playground/run.sh   # ttyd on :7681, bound to loopback
```
Then put a reverse proxy with TLS + rate limiting in front (Caddy/nginx) before exposing it publicly.

## Per-session hardening
`--network=none` · 128 MB RAM · 0.5 CPU · 64 pids · all capabilities dropped · `no-new-privileges` ·
read-only root, tmpfs home (64 MB) · `timeout 45m` · ttyd `--max-clients`. The container is removed on disconnect.

## Trust boundary
ttyd needs Docker access to spawn sessions, so **ttyd is the thing to protect**: run it as a dedicated
user, keep it current, never bind it directly to the public internet without a proxy + rate limit.
Heavier tracks (k3d, Supabase) are deliberately out of this tier.
