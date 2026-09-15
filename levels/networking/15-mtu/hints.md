## 1
The MTU is the biggest packet an interface will send; set too low, large transfers get fragmented or dropped while small requests still sail through. `ip link show eth0` shows `mtu 1400` — smaller than the usual 1500.
## 2
The interface MTU was changed. Set it back with `ip link set`.
## 3
`ip link set eth0 mtu 1500`
