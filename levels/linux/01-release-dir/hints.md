## 1
`mkdir -p` creates a whole path in one go, parents included: `mkdir -p /srv/app/releases/1.4.2/conf`.
## 2
`echo` writes text; `>` sends it into a file (creating it): `echo 1.4.2 > /path/VERSION`.
## 3
`mkdir -p /srv/app/releases/1.4.2/conf && echo 1.4.2 > /srv/app/releases/1.4.2/VERSION`, verify with `ls -R /srv/app` and `cat`.
