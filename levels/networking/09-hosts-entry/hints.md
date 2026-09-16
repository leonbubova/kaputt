## 1
A hostname has to become an IP before anything can connect; the resolver checks the local static table first, then DNS — a name in neither resolves to nothing. `getent hosts api.internal` returns nothing. Static names live in /etc/hosts.
## 2
Each /etc/hosts line is `IP  name`.
## 3
Append `127.0.0.1 api.internal` to /etc/hosts.
