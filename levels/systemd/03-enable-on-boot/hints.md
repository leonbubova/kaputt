## 1
`systemctl enable wg-heartbeat` — read the error. A unit can only be enabled if it declares where it hooks into the boot.
## 2
That is the `[Install]` section: `WantedBy=multi-user.target` means "start me when the system reaches multi-user".
## 3
Append to the unit:
```
[Install]
WantedBy=multi-user.target
```
then `systemctl daemon-reload && systemctl enable wg-heartbeat` (creates the symlink in `multi-user.target.wants/`). `is-enabled` → enabled.
