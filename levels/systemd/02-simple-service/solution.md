Simple service wrapping the script.
    printf '[Unit]\nDescription=heartbeat\n[Service]\nType=simple\nExecStart=/opt/wg/heartbeat/heartbeat.sh\n' > /etc/systemd/system/wg-heartbeat.service
    systemctl daemon-reload && systemctl start wg-heartbeat
