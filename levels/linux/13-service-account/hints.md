## 1
`groupadd NAME` creates a group; `useradd` creates a user. `useradd -m` also creates the home, `-s /bin/bash` sets the shell, `-g GROUP` the primary group.
## 2
Check your work: `id runner` (uid, gid=svc), `getent passwd runner` (home, shell).
## 3
`groupadd svc && useradd -m -g svc -s /bin/bash runner && chown runner:svc /srv/data`
