# Restart= is opt-in: a crashed service stays dead until the unit asks to come back
Lesson: systemd watches the main process, but watching is not restarting. The default is `Restart=no`: when the process dies, the unit goes to `failed` and sits there until a human notices. Supervision has to be declared in the unit.
`Restart=on-failure` restarts after a non-zero exit or a signal (a crash, an OOM kill). `Restart=always` also restarts after a clean exit. `RestartSec=` is the pause before the retry; a second or two is kinder to whatever the service depends on.
It is a unit-file change like any other: edit `[Service]`, `daemon-reload`, then `restart` so the running instance picks up the new policy. `NRestarts` counts how often systemd brought it back — proof the policy did it.
    Restart=on-failure                            restart after crash or non-zero exit
    RestartSec=2                                  wait 2 s before the retry
    systemctl show wg-x -p Restart -p RestartUSec the policy currently in effect
    systemctl show wg-x -p MainPID -p NRestarts   which PID runs, how often it came back
Try it first: `systemctl show wg-api -p Restart` — read what is in effect before changing anything.
Your task: "`wg-api.service` (`/opt/wg/api/api.sh`) got OOM-killed last night. systemd just left it dead. Make systemd bring it back on its own — quickly, within a few seconds."
Goal: `wg-api.service` is active, and when its main process is killed (`kill -9`), systemd restarts it automatically within ~10 s. Don't touch the script.
Check yourself:  wg check      stuck?  wg hint
