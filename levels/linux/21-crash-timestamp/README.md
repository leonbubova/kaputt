# when exactly did the app crash last week?
"Postmortem needs the exact time of the `FATAL` line about the connection pool. Logs in `/var/log/app/` are rotated; the current file only has today's."
Goal: write the timestamp of that FATAL line — exactly as it appears in the log — to `/answer`.
