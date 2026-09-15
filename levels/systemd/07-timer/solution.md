Add a timer unit and enable it.
    printf '[Unit]\nDescription=run wg-cleanup every minute\n[Timer]\nOnCalendar=*:*:00\n[Install]\nWantedBy=timers.target\n' > /etc/systemd/system/wg-cleanup.timer
    systemctl daemon-reload && systemctl enable --now wg-cleanup.timer
