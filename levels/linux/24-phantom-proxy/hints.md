## 1
curl reads `http_proxy` from the environment, and a login shell's environment is assembled from startup files — so a dead proxy setting is an `export` somewhere in those files. `bash -lc 'env | grep -i proxy'` confirms the variable; `grep -rn proxy.old.corp /etc` finds who sets it.
## 2
Login shells run `/etc/profile`, which sources `/etc/profile.d/*.sh`. The apt config is a comment and a different host — a decoy.
## 3
Remove the two `export` lines from `/etc/profile.d/zz-corp.sh`, then `echo /etc/profile.d/zz-corp.sh > /answer`.
