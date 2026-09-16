## 1
An open port belongs to a process, and the kernel knows which one. `ss -ltnp` lists every listener with the owning pid and program name — look at the :9090 line.
## 2
It's a `nc` process (netcat). Stop the process and the port closes with it.
## 3
`pkill -f 'nc -lk'` (or `kill <pid>` from the ss output), then `ss -ltn` to confirm 9090 is gone.
