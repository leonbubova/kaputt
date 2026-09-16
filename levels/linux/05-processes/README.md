# processes — what is running, and stopping it
Lesson: a program that is running is a process. The box runs many at once; each has a number, the PID, and an owner.
    ps aux               list every process: USER, PID, … and at the right end the command that started it
    ps aux | grep WORD   only the lines containing WORD (the pipe from the shell track)
    kill PID             ask process PID to stop. It ends within a second; the number is gone from ps afterwards.
`grep` also shows its own line (`grep WORD` is itself a process at that moment) — ignore that one.
Try it:
    wg shell
    ps aux
    ps aux | grep tick
Your task: someone left `/opt/tick/tick.sh` running on the box. Find its PID and stop it. Do not delete the script.
Where: on the box (`wg shell`).
Check yourself:  wg check      stuck?  wg hint
