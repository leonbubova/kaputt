Declare the variable in the unit.
    sed -i '/^\[Service\]/a Environment=SITE_NAME=berlin-1' /etc/systemd/system/wg-banner.service
    systemctl daemon-reload && systemctl restart wg-banner
