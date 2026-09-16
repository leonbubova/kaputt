Read the PID from systemd, not from ps.
    systemctl show wg-heartbeat -p MainPID --value > /run/wg-heartbeat.pid
