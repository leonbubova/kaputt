# the audit log needs a line saying who ran the script
"Compliance wants every run to start with `user: <login name>`. Write `whoran.sh`: print `user: ` followed by the login name of whoever runs it — looked up at run time, not hard-coded."
Goal: `whoran.sh` prints exactly `user: ` plus the output of `whoami`.
