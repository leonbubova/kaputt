## 1
Every Redis key can carry a time-to-live: when it runs out the key deletes itself, which is how a session store cleans up without a cron job. A session must not live forever — `TTL session:abc` should be a positive number.
## 2
SET can set a value and an expiry together with the EX option.
## 3
`redis-cli SET session:abc token123 EX 300`
