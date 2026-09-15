## 1
A list keeps every element you push, duplicates included; a set is unordered and stores each member exactly once — repeats are dropped on insert. `TYPE tags` is list, with repeats.
## 2
You can't change the type in place; delete it and rebuild as a set with SADD.
## 3
`redis-cli DEL tags; redis-cli SADD tags red green blue`
