## 1
`TYPE events` says string, but the app treats it as a list — hence WRONGTYPE.
## 2
You can't convert a type in place; remove the key, then recreate it as a list.
## 3
`redis-cli DEL events; redis-cli RPUSH events signup login`
