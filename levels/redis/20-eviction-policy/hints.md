## 1
When Redis hits maxmemory, `maxmemory-policy` decides what happens: `noeviction` refuses new writes (OOM errors), the `*-lru` policies drop old keys to make room — right for a cache, wrong for a primary store. `CONFIG GET maxmemory-policy` shows noeviction — a cache should evict.
## 2
Change it at runtime with CONFIG SET.
## 3
`redis-cli CONFIG SET maxmemory-policy allkeys-lru`
