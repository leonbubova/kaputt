Add a restart policy to the service.
    sed -i '/^\[Service\]/a Restart=on-failure\nRestartSec=2' /etc/systemd/system/wg-api.service
    systemctl daemon-reload && systemctl restart wg-api
