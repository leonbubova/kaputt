## 1
A log is a text file; the interesting line is somewhere in the middle. `grep ERROR /var/log/app/app.log` shows it alone.
## 2
grep prints to the screen; `>` sends that into a file instead (shell track): `grep ERROR LOG > /answer`.
## 3
    grep ERROR /var/log/app/app.log > /answer
