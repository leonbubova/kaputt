## 1
Exit codes 200+ come from systemd itself, not from your program: 203/EXEC means systemd could not execute the `ExecStart=` binary at all — the script never ran. `systemctl status wg-report` → `status=203/EXEC`.
## 2
Compare the path in `systemctl cat wg-report` with what is actually on disk: `ls -l /opt/wg/report/`.
## 3
The script lives in `/opt/wg/report/bin/`. `sed -i 's|/opt/wg/report/report.sh|/opt/wg/report/bin/report.sh|' /etc/systemd/system/wg-report.service && systemctl daemon-reload && systemctl restart wg-report`.
