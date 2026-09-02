# start runs it now, enable runs it on boot: the [Install] section
Lesson: `systemctl start` and `systemctl enable` are two different questions. `start` runs the unit now, and only now — after a reboot it is gone. `enable` hooks the unit into the boot sequence so systemd starts it on its own next time.
Boot in systemd is a chain of targets; `multi-user.target` is the normal "system is up, services may run" point. A unit says where it wants to hook in with an `[Install]` section: `WantedBy=multi-user.target`. `enable` then creates a symlink in `multi-user.target.wants/` — that symlink is the whole mechanism. No `[Install]` section, nothing to hook: `enable` refuses.
The two states are independent. A unit can be active but disabled (started by hand), or enabled but inactive (will come up next boot). Checks ask both questions separately.
    [Install]  WantedBy=multi-user.target      where in the boot this unit hooks in
    systemctl enable wg-x                      create the .wants symlink (needs [Install])
    systemctl enable --now wg-x                enable and start in one go
    systemctl is-enabled wg-x                  enabled / disabled / static
    systemctl is-active wg-x                   running right now?
Try it first: `systemctl is-enabled wg-heartbeat` and `systemctl is-active wg-heartbeat` — the two answers differ.
Your task: "`wg-heartbeat.service` works — until the box reboots, then someone has to `systemctl start` it by hand. Make it come up on boot."
Goal: `systemctl is-enabled wg-heartbeat` says `enabled`, and the service is active now.
Check yourself:  wg check      stuck?  wg hint
