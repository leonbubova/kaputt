# running a file needs the execute bit, even for root
Lesson: to run a script by its path, the kernel checks the file's mode for the execute bit (`x`). Without it the file is just readable text — bash can read it, but nothing can *run* it. That gives "Permission denied", even for root, even though root can read every byte.
This is why "Permission denied" is not always about ownership. Read the mode first: `-rw-r--r--` has no `x` anywhere; `-rwxr-xr-x` does. Files lose the bit when they are copied through tools that do not preserve modes — an upload, a paste, a git checkout on some systems.
`chmod +x` adds the bit for everyone; `chmod u+x` only for the owner. The content of the script does not change.
    ls -l FILE                is there an x in the mode?
    chmod +x FILE             add the execute bit
    bash FILE                 run it without the bit (bash reads it as input)
    ./FILE or /full/path      run it by path — needs the bit
Try it first: `ls -l /bin/ls /etc/hostname` — a program has x, a data file does not.
Your task: "The post-deploy hook `/opt/tools/healthcheck.sh` worked on the old box, here it just says Permission denied. We're root, how can that be?"
Goal: `/opt/tools/healthcheck.sh` runs and prints `healthcheck ok`. Don't rewrite the script.
Check yourself:  wg check      stuck?  wg hint
