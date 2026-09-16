# heartbeat is gone after every reboot
"`wg-heartbeat.service` works — until the box reboots, then someone has to `systemctl start` it by hand. Make it come up on boot."
Goal: `systemctl is-enabled wg-heartbeat` says `enabled`, and the service is active now.
