# report service fails instantly, status shows 203/EXEC
"`wg-report.service` was rolled out this morning and has never been up. `journalctl` just says `Failed at step EXEC`. The deploy put the script in place — leave it where it is, don't copy or move it."
Goal: `wg-report.service` is active and `/opt/wg/report/out/report.txt` is being updated.
