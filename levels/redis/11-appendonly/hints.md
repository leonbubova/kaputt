## 1
Redis serves from memory; writing to disk is optional. The append-only file (AOF) logs every write so a restart can replay it — with it off, a crash loses everything since the last snapshot. `CONFIG GET appendonly` returns no.
## 2
Enable it at runtime with CONFIG SET.
## 3
`redis-cli CONFIG SET appendonly yes`
