# ports — who is listening?
Lesson: an address reaches a machine, but a machine runs many programs. So every conversation also names a
port — a number from 1 to 65535. A program that wants to be talked to "listens" on a port; if nobody listens
on a port, a connection to it is refused. Address plus port is the full destination: `127.0.0.1:8080`.
`ss -ltnp` lists every listening port and the program behind it (l = listening, t = tcp, n = numbers, p = program):
    ss -ltnp
One line per listener. `Local Address:Port` says where it listens: `0.0.0.0:22` means port 22 on every address,
`127.0.0.1:22` would mean only from this machine. At the end, `users:(("NAME",pid=…))` names the program.
Your task: one program named `nc` is listening in this box. Find its port number and write only that number
into the file `/root/port.txt`.
Work inside the box (`wg shell`).
Check yourself:  wg check      stuck?  wg hint
