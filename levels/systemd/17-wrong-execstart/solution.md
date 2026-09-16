ExecStart points at a path that does not exist (203/EXEC); script is in bin/.
    sed -i 's|/opt/wg/report/report.sh|/opt/wg/report/bin/report.sh|' /etc/systemd/system/wg-report.service
    systemctl daemon-reload && systemctl restart wg-report
