## 1
Starting nginx fails with "address already in use". `ss -ltnp` shows what owns :8080.
## 2
A `nc` process is listening on 8080. Kill it.
## 3
`pkill -f 'nc -lk'` then `nginx`.
