## 1
Only one process may listen on a port at a time; "address already in use" means someone else already holds it, and the kernel can tell you who. Starting nginx fails with that message. `ss -ltnp` shows what owns :8080.
## 2
A `nc` process is listening on 8080. Kill it.
## 3
`pkill -f 'nc -lk'` then `nginx`.
