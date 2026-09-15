## 1
Key names are just strings, and by convention prefixes like `tmp:` or `session:` group related keys. You don't need the exact name to find a key — Redis can list keys matching a pattern.
## 2
KEYS pattern lists every matching key name (`*` is a wildcard). Then DEL the one it shows.
## 3
`redis-cli KEYS 'tmp:*'` → tmp:import-7f3a9c, then `redis-cli DEL tmp:import-7f3a9c`
