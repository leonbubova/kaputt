## 1
`getent hosts api.internal` returns nothing. Static names live in /etc/hosts.
## 2
Each /etc/hosts line is `IP  name`.
## 3
Append `127.0.0.1 api.internal` to /etc/hosts.
