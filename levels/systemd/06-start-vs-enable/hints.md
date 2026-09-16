## 1
`start` = now, `enable` = at every boot. They are independent: check both with `systemctl status NAME` (the `Loaded:` line shows `enabled` or `disabled`) or `systemctl is-enabled NAME`.
## 2
`systemctl enable wg-clock` — the answer mentions a symlink it created in `multi-user.target.wants/`. That symlink is what "enabled" means.
## 3
    systemctl enable wg-clock
    systemctl is-enabled wg-clock
