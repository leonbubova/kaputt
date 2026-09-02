## 1
`systemctl status wg-metrics` → `status=200/CHDIR`. Exit codes 200+ come from systemd itself: CHDIR = it could not change into the configured directory.
## 2
`systemctl show wg-metrics -p WorkingDirectory` vs. `ls -d /opt/wg/metrics/*`.
## 3
Typo: `ap` → `app`. `sed -i 's|WorkingDirectory=/opt/wg/metrics/ap$|WorkingDirectory=/opt/wg/metrics/app|' /etc/systemd/system/wg-metrics.service && systemctl daemon-reload && systemctl restart wg-metrics`.
