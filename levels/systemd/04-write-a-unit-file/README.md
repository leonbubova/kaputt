# a service is a text file — the unit file
Lesson: where does systemd know `wg-clock` from? From a small text file, the *unit file*. Yours live in
`/etc/systemd/system/` and are named `NAME.service`. Look at the one you have been using:
    cat /etc/systemd/system/wg-clock.service
Two sections, each starting with a name in square brackets:
    [Unit]                    who this is: Description= is free text
    [Service]                 what to run: ExecStart= is the program, with its full path starting at /
    Type=simple               "the program keeps running" (the clock). Type=oneshot means "it runs, finishes, done"
systemd reads these files only when you tell it to. After creating or changing one, always:
    systemctl daemon-reload   re-read all unit files. Forget it and systemd keeps using the old version
Your task: create the file `/etc/systemd/system/wg-hello.service` with exactly these five lines, then run
`systemctl daemon-reload`. (Shell track: `nano /etc/systemd/system/wg-hello.service`, type, Ctrl+O Enter saves, Ctrl+X leaves.)
    [Unit]
    Description=my first unit
    [Service]
    Type=oneshot
    ExecStart=/bin/echo hello from my first unit
Afterwards `systemctl status wg-hello` says `Loaded: loaded` instead of `could not be found`.
Work in `wg shell`.
Check yourself:  wg check      stuck?  wg hint
