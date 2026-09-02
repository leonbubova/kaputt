## 1
An interface can carry more than one IP. `ip addr show eth0` lists the ones it has now — 10.99.0.5 isn't among them.
## 2
The `ip` tool changes addresses with `ip addr add <ip>/<prefix> dev <interface>`. A single host address is /32.
## 3
`ip addr add 10.99.0.5/32 dev eth0`, then `ip addr show eth0` and `curl 10.99.0.5:8080`.
