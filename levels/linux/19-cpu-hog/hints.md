## 1
`top` (press `P`) or `ps -eo pid,pcpu,user,args --sort=-pcpu | head`. The name looks like a kernel thread — but kernel threads have no path.
## 2
`ls -l /proc/PID/exe` — a real kworker lives in the kernel, this one is a copied binary under `/usr/local/lib/.cache/`.
## 3
`kill PID` (then remove the binary so nobody restarts it).
