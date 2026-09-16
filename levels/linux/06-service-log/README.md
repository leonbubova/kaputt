# the log — where a program writes what happened
Lesson: a service is a program that runs in the background all the time — a web server, a database. It has no
screen, so it writes what happens into a log file: one line per event, newest at the bottom. On Linux logs live
under `/var/log`. Reading the log is the first step of nearly every incident.
    ls /var/log              the logs on this box; our app writes to /var/log/app/
    tail -5 FILE             the last 5 lines — the most recent events
    tail -f FILE             follow: keeps showing new lines as they arrive. Ctrl+C stops it.
    grep ERROR FILE          only the lines that contain ERROR (shell track)
Try it:
    wg shell
    ls /var/log/app
    tail -5 /var/log/app/app.log
    grep ERROR /var/log/app/app.log
Your task: `/var/log/app/app.log` has exactly one line with `ERROR`. Write that whole line into the file `/answer`.
Where: on the box (`wg shell`). `/answer` is a plain file at the top of the box — later levels use it the same way.
Check yourself:  wg check      stuck?  wg hint
