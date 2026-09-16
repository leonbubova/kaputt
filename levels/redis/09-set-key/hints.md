## 1
Redis is a key → value store: a key either exists with a value or it doesn't, and reading a missing key gives nil rather than an error. `GET app:name` returns nil. The key must hold the string `shop`.
## 2
Strings are written with SET.
## 3
`redis-cli SET app:name shop`
