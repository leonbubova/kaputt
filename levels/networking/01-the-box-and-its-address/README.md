# the box has an address
Lesson: this track happens inside one small Linux machine (the "box"). `wg shell` puts your terminal inside it;
`exit` brings you back. Every machine on a network has an IP address — four numbers with dots, like `172.17.0.2`.
It is the machine's house number: anyone who wants to talk to it sends to that address. One address is special:
`127.0.0.1` always means "this machine itself" (also called localhost or loopback).
Try it — enter the box and look at its addresses:
    wg shell
    ip addr
Each block is one network card. `lo` is the loopback (127.0.0.1). `eth0` is the real one — the line starting
with `inet` shows its address; the `/16` after it is not part of the address. `ip route` shows where packets
leave the box (the `default via …` line); just look at it for now.
Your task: write the box's eth0 address (only the four numbers with dots, no `/16`) into the file `/root/my-ip.txt`.
Work inside the box (`wg shell`); `echo` and `>` from the shell track work here too.
Check yourself:  wg check      stuck?  wg hint
