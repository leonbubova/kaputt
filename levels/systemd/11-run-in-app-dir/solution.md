Set the working directory in the unit.
    sed -i '/^\[Service\]/a WorkingDirectory=/opt/wg/exporter/app' /etc/systemd/system/wg-exporter.service
    systemctl daemon-reload && systemctl restart wg-exporter
