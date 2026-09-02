## 1
A hash is a small record under one key — several field/value pairs (name, age, …) you can read or update individually instead of storing one blob. `HGETALL user:1` is empty.
## 2
HSET sets one or more fields at once.
## 3
`redis-cli HSET user:1 name anna age 30`
