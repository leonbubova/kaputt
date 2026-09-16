## 1
A name that resolves is not a name that resolves *correctly* — clients connect to whatever IP the resolver hands them, healthy service or not. `getent hosts api.internal` returns 10.0.0.99 — not this box. The API is on 127.0.0.1.
## 2
The /etc/hosts entry has the wrong IP.
## 3
Fix the line to `127.0.0.1 api.internal`.
