## 1
`TYPE tags` is list, with repeats. A set stores each member once.
## 2
You can't change the type in place; delete it and rebuild as a set with SADD.
## 3
`redis-cli DEL tags; redis-cli SADD tags red green blue`
