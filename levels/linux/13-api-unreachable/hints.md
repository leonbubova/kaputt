## 1
Where does the name resolve to? `getent hosts api.internal`. Compare with where the service listens: `ss -ltnp`.
## 2
Name lookup consults `/etc/hosts` before DNS. Read it.
## 3
Point the entry at `127.0.0.1` (or delete it if DNS is supposed to answer). Note: `sed -i` fails on `/etc/hosts` in a container — edit with vim or `>`/`>>`.
