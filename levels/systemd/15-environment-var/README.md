# banner service fails: "SITE_NAME not set"
"`wg-banner.service` (`/opt/wg/banner/banner.sh`) needs to know which site it runs on: the script wants `SITE_NAME`, and this box is `berlin-1`. Export it in your shell and run the script — works. Under systemd it bails. Don't change the script."
Goal: `wg-banner.service` is active and `/opt/wg/banner/state` says `site=berlin-1`.
