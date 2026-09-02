# "No space left on device" on the data volume
"`/opt/app/write-state` fails with ENOSPC on `/var/lib/appdata`. That volume is 64M and our db dir is tiny. Where did the space go?"
Goal: `/opt/app/write-state` prints `state written`; `/var/lib/appdata` stays the data volume. Don't delete the `db/` or `logs/` dirs.
