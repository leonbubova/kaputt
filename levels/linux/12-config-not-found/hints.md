## 1
`ls -l /etc/app/` — config.yaml is not a regular file. Where does it point? `readlink -f /etc/app/config.yaml`
## 2
The target does not exist. Compare with what is actually in `/etc/app/versions/` — look at the extension.
## 3
`ln -sfn /etc/app/versions/config-v2.yml /etc/app/config.yaml` (or rename the target to `.yaml`).
