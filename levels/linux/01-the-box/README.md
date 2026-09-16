# the box — a second computer inside your terminal
Lesson: this track plays on a "box": a small Linux machine that runs on your computer but is separate from it —
its own files, its own users, its own programs. Servers at work are boxes like this; you reach them through a
terminal exactly the same way. Your own files are NOT on the box, and nothing you do there can hurt your computer.
    wg shell      step onto the box. The prompt changes to root@prod-app-01 — that is the box's name.
    hostname      prints the name of the machine you are on right now
    exit          step off the box, back to your own computer
Try it:
    wg shell
    hostname
    ls /
    exit
    hostname             your own computer answers this time
Every `wg level` and `wg reset` rebuilds the box from scratch — files you made there are gone, on purpose.
Your task: on the box, create the file `/root/i-am-in.txt` containing the word `hello` (the `echo … > FILE` from the shell track).
Where: `wg shell`, then type the command there. `wg check` works from either side — leave the box with `exit` or open a second terminal.
Check yourself:  wg check      stuck?  wg hint
