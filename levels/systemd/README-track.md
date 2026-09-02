# systemd track — how the environment works

systemd needs to be PID 1 — that rules out plain Docker containers and macOS. The track therefore runs on a real
Linux box over ssh (default `station44`, Ubuntu 24.04, systemd 255, passwordless sudo). Override with
`WG_SYSTEMD_HOST=<host>`.

- `bin/wg` runs on the Mac. `track.sh`, `break.sh`, `check.sh`, `solutions.sh` execute everything remotely via
  `ssh <host> sudo -n bash -s` (helpers in `lib.sh`: `X`, `XS`, `XI`, `prop`, `unit_file`, `script`). ssh ControlMaster keeps one
  connection alive so per-call latency is small.
- **Why system manager + sudo, not `systemctl --user`:** the user session works on station44, but `Linger=no` (it can be torn down
  between ssh calls) and several levels need `User=`, file ownership and `/etc/systemd/system` semantics that only exist for the
  system manager.
- Play area: units `/etc/systemd/system/wg-*.{service,timer,target}`, scripts/data under `/opt/wg/<name>/`, configs `/etc/wg/`,
  runtime files `/run/wg-*`, service user `wg-app` (created by `wg start`, removed by `wg stop`).
- `track_wipe` (before every level): stop + disable every `wg-*` unit, delete the unit files and wants-symlinks, `pkill -u wg-app`,
  `rm -rf /opt/wg /etc/wg /run/wg-*`, `daemon-reload`, `reset-failed`. Nothing outside the prefixes is touched.
- `wg shell` → `ssh -t <host> sudo -i` (root shell on the box). Players edit units with `systemctl edit --full wg-x` or an editor,
  then `systemctl daemon-reload && systemctl restart wg-x`; `systemctl status`, `journalctl -u`, `systemd-analyze verify/calendar`.
- `check.sh` asserts outcomes remotely: `systemctl is-active/is-enabled`, `systemctl show -p Result/NRestarts/MainPID/LastTriggerUSec`,
  files written by the services, sha256 of provided scripts (recorded in `/opt/wg/.expect` by break.sh) where the story forbids changing them.
- Test from the Mac: `test/run-all.sh systemd`. Timer levels (05, 13) wait up to ~75 s for the first trigger.
