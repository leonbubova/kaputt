# exporter only works when started from its own directory
"`wg-exporter.service` was set up but never came up. `/opt/wg/exporter/app/exporter.sh` reads `targets.txt` from the directory it is started in — `cd /opt/wg/exporter/app && ./exporter.sh` by hand is fine. Make the unit start it the same way. Don't change the script, don't wrap it in a shell."
Goal: `wg-exporter.service` is active and `/opt/wg/exporter/app/status` says `targets=3`.
