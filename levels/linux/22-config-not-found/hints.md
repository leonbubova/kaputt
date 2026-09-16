## 1
A symlink is just a name pointing at another path: `ls` lists it, but opening it follows the pointer — if the target is gone you get "No such file" even though the link is right there. `ls -l /etc/app/` shows it is not a regular file; `readlink -f /etc/app/config.yaml` shows where it points.
## 2
The target does not exist. Compare with what is actually in `/etc/app/versions/` — look at the extension.
## 3
`ln -sfn /etc/app/versions/config-v2.yml /etc/app/config.yaml` (or rename the target to `.yaml`).
