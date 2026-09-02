Load the env file in the unit.
    sed -i '/^\[Service\]/a EnvironmentFile=/etc/wg/api.env' /etc/systemd/system/wg-api.service
    systemctl daemon-reload && systemctl restart wg-api
