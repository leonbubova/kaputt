## 1
Which group grants sudo? `cat /etc/sudoers.d/*`. Which groups is alice in? `id alice`.
## 2
`%ops` in sudoers vs `operators` in her groups — a rule for a group nobody is in.
## 3
`usermod -aG ops alice` (or change the sudoers rule to `%operators`). No re-login needed for `su -`.
