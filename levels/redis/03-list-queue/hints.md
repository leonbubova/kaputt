## 1
`LRANGE queue:jobs 0 -1` is empty. Order matters: build at index 0.
## 2
RPUSH appends to the tail, keeping insertion order.
## 3
`redis-cli RPUSH queue:jobs build test deploy`
