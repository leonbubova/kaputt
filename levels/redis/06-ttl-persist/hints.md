## 1
Keys have no expiry unless you give them one — a plain SET lives until deleted. `TTL` reports the seconds left, and -1 means "never expires". `TTL session:live` returns -1 — the key has no expiry.
## 2
EXPIRE sets a TTL on an existing key without touching its value.
## 3
`redis-cli EXPIRE session:live 3600`
