Unit has no [Install] section, so it cannot be enabled.
    printf '\n[Install]\nWantedBy=multi-user.target\n' >> /etc/systemd/system/wg-heartbeat.service
    systemctl daemon-reload && systemctl enable --now wg-heartbeat
