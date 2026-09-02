## 1
A process can call itself anything — the name you see is just a string, but where its binary actually lives cannot lie (real kernel threads have no path at all). Find the hog: `top` (press `P`) or `ps -eo pid,pcpu,user,args --sort=-pcpu | head`.
## 2
`ls -l /proc/PID/exe` — a real kworker lives in the kernel, this one is a copied binary under `/usr/local/lib/.cache/`.
## 3
`kill PID` (then remove the binary so nobody restarts it).
