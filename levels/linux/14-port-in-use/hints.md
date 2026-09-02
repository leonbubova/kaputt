## 1
Who owns the port? `ss -ltnp | grep 8080` (or `lsof -i :8080`). Look at the pid and its command line: `ps -fp PID`.
## 2
Something is serving from a hidden dir under `/var/tmp`. It is not the web service. Stop it.
## 3
`kill PID`, then start the service so it survives your shell: `nohup /opt/web/start.sh >/dev/null 2>&1 &`
