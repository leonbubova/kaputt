# monitoring needs the PID of the heartbeat as systemd sees it
"The new log shipper watches `wg-heartbeat.service` by PID. Write the main PID of the service into `/run/wg-heartbeat.pid` — the one systemd tracks, not whatever `ps` turns up; Tom's old hand-started copy is still running somewhere."
Goal: `/run/wg-heartbeat.pid` contains exactly the main PID of the active `wg-heartbeat.service`, one line.
