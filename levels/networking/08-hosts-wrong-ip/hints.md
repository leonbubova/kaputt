## 1
`getent hosts api.internal` returns 10.0.0.99 — not this box. The API is on 127.0.0.1.
## 2
The /etc/hosts entry has the wrong IP.
## 3
Fix the line to `127.0.0.1 api.internal`.
