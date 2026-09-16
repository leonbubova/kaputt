## 1
"Permission denied" on a file you own as root is almost never about ownership. Look at the mode: `ls -l /opt/tools/healthcheck.sh`.
## 2
A script needs the execute bit to be run as `./script`. `-rw-r--r--` has none.
## 3
`chmod +x /opt/tools/healthcheck.sh`
