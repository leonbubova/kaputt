## 1
`CONFIG GET appendonly` returns no. AOF logs every write for durability.
## 2
Enable it at runtime with CONFIG SET.
## 3
`redis-cli CONFIG SET appendonly yes`
