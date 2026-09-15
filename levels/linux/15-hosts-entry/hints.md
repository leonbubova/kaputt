## 1
Before a box asks DNS it checks its own list of names: `/etc/hosts`, one `ADDRESS NAME` pair per line. `getent hosts mock.internal` shows what the box resolves right now (nothing), `cat /etc/hosts` shows the list.
## 2
Append a line — `127.0.0.1 mock.internal` — and test again with `getent hosts mock.internal`, then `curl`.
## 3
`echo "127.0.0.1 mock.internal" >> /etc/hosts` (in a container `sed -i` cannot replace `/etc/hosts`; `>>` and vim work).
