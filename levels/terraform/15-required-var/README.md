# non-interactive apply fails: No value for required variable
"CI runs with no TTY and apply dies: `No value for required input variable ... "port"`. The service should default to port 8080 when nothing overrides it. Make an unattended apply succeed."
Goal: `apply` with no input writes `out/cfg.txt` containing `port=8080`.
