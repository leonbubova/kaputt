# api died at 03:00 and stayed dead until someone noticed at 09:00
"`wg-api.service` (`/opt/wg/api/api.sh`) got OOM-killed last night. systemd just left it dead. Make systemd bring it back on its own — quickly, within a few seconds."
Goal: `wg-api.service` is active, and when its main process is killed (`kill -9`), systemd restarts it automatically within ~10 s. Don't touch the script.
