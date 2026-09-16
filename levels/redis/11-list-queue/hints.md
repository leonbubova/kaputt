## 1
A list is an ordered sequence: elements keep the position they were inserted at, and you choose which end to push onto (head or tail). Order matters here: build at index 0. `LRANGE queue:jobs 0 -1` is empty.
## 2
RPUSH appends to the tail, keeping insertion order.
## 3
`redis-cli RPUSH queue:jobs build test deploy`
