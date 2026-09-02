## 1
`CONFIG GET maxmemory-policy` shows noeviction — a cache should evict.
## 2
Change it at runtime with CONFIG SET.
## 3
`redis-cli CONFIG SET maxmemory-policy allkeys-lru`
