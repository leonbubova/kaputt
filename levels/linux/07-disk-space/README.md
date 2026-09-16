# disk space — df and du
Lesson: a disk is full when a program cannot write any more — "No space left on device". Two questions, two commands:
    df -h                how much is free on each disk?  (disk free; -h = human sizes like 12M, 3.4G)
    du -sh DIR           how big is this folder, everything inside included?  (disk usage; -s = one sum, -h = human)
    du -sh DIR/*         one line per thing inside DIR — sort by eye, the biggest is the culprit
On the box `/var/lib/appdata` is a small separate disk (64M) where the app keeps its data.
Try it:
    wg shell
    df -h /var/lib/appdata
    du -sh /var/lib/appdata
    du -sh /var/lib/appdata/*
Your task: one folder inside `/var/lib/appdata` takes almost all the space. Write its name — just the name,
e.g. `logs` — into `/answer`. Delete nothing.
Where: on the box (`wg shell`).
Check yourself:  wg check      stuck?  wg hint
