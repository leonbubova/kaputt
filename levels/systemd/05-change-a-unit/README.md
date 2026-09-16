# change a unit file — daemon-reload, then restart
Lesson: changing what a service does = edit its unit file, `daemon-reload`, then start it again. Three steps,
always in this order. Skip the middle one and systemd runs the old command — the file on disk has changed,
but systemd still holds the version it read last time. `systemctl status` even warns about it:
`Warning: The unit file ... changed on disk. Run 'systemctl daemon-reload'`.
`wg-hello` from the last lesson now writes into a file instead of the journal. Try it:
    cat /etc/systemd/system/wg-hello.service
    cat /opt/wg/hello/out
The ExecStart line is `/bin/sh -c 'echo hello > /opt/wg/hello/out'` and the file says `hello`.
Your task: make `wg-hello` write `hello again` instead of `hello`. Edit the ExecStart line in
`/etc/systemd/system/wg-hello.service` (only the word inside the quotes changes: `echo hello again > ...`),
then `systemctl daemon-reload`, then `systemctl start wg-hello`. Afterwards `/opt/wg/hello/out` says `hello again`.
Work in `wg shell`.
Check yourself:  wg check      stuck?  wg hint
