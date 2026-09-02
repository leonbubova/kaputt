# systemd — the commands you'll actually use
`wg shell` = root on the box. Your units: /etc/systemd/system/wg-*.service (and .timer); scripts under /opt/wg/<name>/, configs in /etc/wg/.

  systemctl status wg-x                    active? failed? last log lines + exit status (203/EXEC = bad ExecStart path, 200/CHDIR = bad WorkingDirectory)
  journalctl -u wg-x -n 50                 what the service itself printed
  systemctl cat wg-x  /  systemctl show wg-x -p Restart -p MainPID    the unit as systemd sees it / one property, no guessing
  systemctl daemon-reload                  ALWAYS after editing a unit file — otherwise systemd keeps running the old one
  systemctl start|restart|stop wg-x        run it now
  systemctl enable --now wg-x              start now + on boot (needs an [Install] section)
  systemctl is-active / is-enabled wg-x    the two yes/no questions every check asks
  systemctl list-timers --all              timers: NEXT / LAST / which service they fire
  systemd-analyze verify wg-x.service  ·  systemd-analyze calendar '*:*:00'    lint a unit / decode an OnCalendar
  [Service] Type=simple|oneshot  ExecStart=/abs/path  Restart=on-failure RestartSec=2  EnvironmentFile=/etc/wg/x.env  WorkingDirectory=/dir
  [Install] WantedBy=multi-user.target     timers: [Timer] OnCalendar=…  +  WantedBy=timers.target — you enable the .timer, not the .service

Mental model: a unit file is a declaration; systemd only re-reads it on `daemon-reload`. Services get no shell, no env, no cwd — every path absolute, every variable via Environment/EnvironmentFile. `status` first: exit codes 200–243 mean systemd itself failed before your script ever ran.
