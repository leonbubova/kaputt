## 1
A session must not live forever. `TTL session:abc` should be a positive number.
## 2
SET can set a value and an expiry together with the EX option.
## 3
`redis-cli SET session:abc token123 EX 300`
