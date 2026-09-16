## 1
`ping -c 3 ADDRESS` sends three probes and prints a summary. Everything ping prints can go into a file with `>`, exactly like echo.
## 2
`ping -c 3 127.0.0.1 > /root/ping.txt` — the screen stays empty for three seconds, then the prompt returns; the text is in the file (`cat /root/ping.txt`).
## 3
    ping -c 3 127.0.0.1 > /root/ping.txt
