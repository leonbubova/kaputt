Write the unit file, then make systemd re-read its files.
    printf '[Unit]\nDescription=my first unit\n[Service]\nType=oneshot\nExecStart=/bin/echo hello from my first unit\n' > /etc/systemd/system/wg-hello.service
    systemctl daemon-reload
