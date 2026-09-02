# machine-applied solutions, one function per level — used by run-all.sh only.
# Each sNN applies the reference fix on the remote box via the lib.sh helpers.
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"

s01(){ unit_file wg-marker.service <<'U'
[Unit]
Description=provisioning marker
[Service]
Type=oneshot
ExecStart=/bin/sh -c 'hostname > /opt/wg/marker/ran'
U
SC start wg-marker.service; }

s02(){ unit_file wg-heartbeat.service <<'U'
[Unit]
Description=heartbeat
[Service]
Type=simple
ExecStart=/opt/wg/heartbeat/heartbeat.sh
U
SC start wg-heartbeat.service; }

s03(){ unit_file wg-heartbeat.service <<'U'
[Unit]
Description=heartbeat
[Service]
Type=simple
ExecStart=/opt/wg/heartbeat/heartbeat.sh
[Install]
WantedBy=multi-user.target
U
SC enable --now wg-heartbeat.service; }

s04(){ unit_file wg-api.service <<'U'
[Unit]
Description=wg api
[Service]
Type=simple
ExecStart=/opt/wg/api/api.sh
Restart=on-failure
RestartSec=2
[Install]
WantedBy=multi-user.target
U
SC restart wg-api.service; }

s05(){ unit_file wg-cleanup.timer <<'U'
[Unit]
Description=run wg-cleanup every minute
[Timer]
OnCalendar=*:*:00
[Install]
WantedBy=timers.target
U
SC enable --now wg-cleanup.timer; }

s06(){ unit_file wg-api.service <<'U'
[Unit]
Description=wg api
[Service]
Type=simple
ExecStart=/opt/wg/api/api.sh
EnvironmentFile=/etc/wg/api.env
U
SC restart wg-api.service; }

s07(){ unit_file wg-report.service <<'U'
[Unit]
Description=wg report generator
[Service]
Type=simple
ExecStart=/opt/wg/report/bin/report.sh
[Install]
WantedBy=multi-user.target
U
SC restart wg-report.service; }

s08(){ unit_file wg-metrics.service <<'U'
[Unit]
Description=wg metrics agent
[Service]
Type=simple
WorkingDirectory=/opt/wg/metrics/app
ExecStart=/opt/wg/metrics/app/agent.sh
U
SC restart wg-metrics.service; }
