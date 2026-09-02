## 1
A string that contains an integer can be incremented in place, atomically — no read, add, write back. That's how counters work in Redis.
## 2
INCR key adds 1 and returns the new value.
## 3
`redis-cli INCR deploy:count`
