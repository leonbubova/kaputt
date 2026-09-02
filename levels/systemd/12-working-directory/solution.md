WorkingDirectory has a typo (200/CHDIR).
    sed -i 's|WorkingDirectory=/opt/wg/metrics/ap$|WorkingDirectory=/opt/wg/metrics/app|' /etc/systemd/system/wg-metrics.service
    systemctl daemon-reload && systemctl restart wg-metrics
