# is anyone there? — ping
Lesson: before asking a machine anything, ask whether it is reachable at all. `ping ADDRESS` sends a tiny
"are you there?" packet to that address and prints one line per answer, with the time it took. No answers
means: the address is wrong, the machine is off, or something on the way drops the packets.
`-c 3` means "send 3, then stop" — without it ping runs forever (Ctrl+C stops it).
Try it — inside the box:
    ping -c 3 127.0.0.1
Three lines with `time=…`, then a summary: `3 packets transmitted, 3 received, 0% packet loss`. That is a healthy answer.
Now try an address nobody has:  `ping -c 2 10.255.255.1`  — it waits, then reports `100% packet loss`.
Your task: ping `127.0.0.1` exactly 3 times and save ping's whole output into the file `/root/ping.txt`.
Work inside the box (`wg shell`). One command, `>` at the end.
Check yourself:  wg check      stuck?  wg hint
