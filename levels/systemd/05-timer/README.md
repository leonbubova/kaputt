# tmp cleanup exists but nobody runs it
"`wg-cleanup.service` (oneshot) purges `/opt/wg/cleanup/tmp` and writes `/opt/wg/cleanup/last-run`. It works when started by hand. It should run every minute, automatically, and survive reboots. No cron — we're on systemd."
Goal: a `wg-cleanup.timer` is active and enabled, fires every minute, and has triggered `wg-cleanup.service` at least once.
