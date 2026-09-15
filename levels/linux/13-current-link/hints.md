## 1
A symbolic link is a tiny file that holds another path; opening the link opens that path. `ln -s TARGET LINKNAME` creates one — target first, then the name of the link.
## 2
Use an absolute target so the link works from anywhere. `ls -l /opt/app` shows a link as `current -> /opt/app/releases/1.4.2`; `readlink -f /opt/app/current` prints where it ends up.
## 3
`ln -s /opt/app/releases/1.4.2 /opt/app/current` (if a link already exists: `ln -sfn` overwrites it).
