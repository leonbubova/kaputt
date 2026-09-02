## 1
Every key has exactly one data type, fixed when it is created, and each command only works on its own type — LPUSH on a string key is refused with WRONGTYPE. `TYPE events` says string, but the app treats it as a list.
## 2
You can't convert a type in place; remove the key, then recreate it as a list.
## 3
`redis-cli DEL events; redis-cli RPUSH events signup login`
