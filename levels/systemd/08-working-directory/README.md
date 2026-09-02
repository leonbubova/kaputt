# metrics agent dies with 200/CHDIR
"`wg-metrics.service` never comes up. The agent reads `config.ini` from its own directory (`/opt/wg/metrics/app`), works fine when you `cd` there and run it by hand. Don't change the agent."
Goal: `wg-metrics.service` is active and `/opt/wg/metrics/app/status` shows the interval from `config.ini`.
