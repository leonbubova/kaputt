## 1
A key only expires if someone gave it a time-to-live. Redis reports the seconds left for any key: a positive number means it will expire, -1 means it never will.
## 2
Ask TTL for each session key; the one answering -1 is the leak. Remove it with DEL.
## 3
`redis-cli TTL session:a` / `session:b` / `session:c` → session:b is -1, then `redis-cli DEL session:b`
