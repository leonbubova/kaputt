## 1
`TTL session:live` returns -1 — the key has no expiry.
## 2
EXPIRE sets a TTL on an existing key without touching its value.
## 3
`redis-cli EXPIRE session:live 3600`
