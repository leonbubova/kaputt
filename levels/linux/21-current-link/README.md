# /opt/app/current must point at the newest release
Ticket: "Releases are unpacked into `/opt/app/releases/` (1.4.1 and 1.4.2 are there). The tooling reads `/opt/app/current/VERSION`. Make `/opt/app/current` a symbolic link to the newest release — no copying, the next rollout should just be re-pointing the link."
Goal: `/opt/app/current` is a symlink to `/opt/app/releases/1.4.2`; `cat /opt/app/current/VERSION` prints `1.4.2`.
