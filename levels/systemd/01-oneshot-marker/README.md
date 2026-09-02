# ops wants a "this box was provisioned" marker written by systemd
"On the target host we need a unit `wg-marker.service` that runs once and writes the hostname into `/opt/wg/marker/ran`. No daemon, no loop — run it, it writes, it's done."
Goal: `wg-marker.service` exists in `/etc/systemd/system`, is a oneshot, has been started successfully, and `/opt/wg/marker/ran` contains the hostname.
