A timer unit with the same name starts the service every minute.
    printf '[Unit]\nDescription=run wg-tick every minute\n[Timer]\nOnCalendar=*:*:00\n' > /etc/systemd/system/wg-tick.timer
    systemctl daemon-reload && systemctl start wg-tick.timer
