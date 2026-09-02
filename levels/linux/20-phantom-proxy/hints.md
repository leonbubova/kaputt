## 1
`bash -lc 'env | grep -i proxy'` confirms the variable. Now find who sets it: `grep -rn proxy.old.corp /etc`.
## 2
Login shells run `/etc/profile`, which sources `/etc/profile.d/*.sh`. The apt config is a comment and a different host — a decoy.
## 3
Remove the two `export` lines from `/etc/profile.d/zz-corp.sh`, then `echo /etc/profile.d/zz-corp.sh > /answer`.
