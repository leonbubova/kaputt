# start now vs. start at boot — enable
Lesson: `systemctl start` runs a service now — and only now. After a reboot it stays off, unless you *enable*
it. Enable means: hook it into the boot sequence. Both orders exist for a reason: a service can be running but
not enabled (gone after reboot), or enabled but stopped (comes back at the next boot).
    systemctl enable NAME       start it at every boot from now on
    systemctl is-enabled NAME   answers enabled or disabled
    systemctl enable --now NAME enable it AND start it now, one command
Enable only works if the unit file says *where* in the boot to hook in — that is the third section:
    [Install]
    WantedBy=multi-user.target  "start me when the system is up for normal use"
Try it — `wg-clock` is running and already has that section:
    cat /etc/systemd/system/wg-clock.service
    systemctl is-enabled wg-clock
It says `disabled`: it runs now, but a reboot would kill it for good.
Your task: enable `wg-clock`. Afterwards `systemctl is-enabled wg-clock` says `enabled` and it is still running.
Work in `wg shell`.
Check yourself:  wg check      stuck?  wg hint
