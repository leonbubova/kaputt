# deploy hook fails with "Permission denied"
Team says: "the post-deploy hook `/opt/tools/healthcheck.sh` worked on the old box, here it just says Permission denied. We're root, how can that be?"
Goal: `/opt/tools/healthcheck.sh` runs and prints `healthcheck ok`. Don't rewrite the script.
