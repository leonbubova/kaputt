## 1
Server settings (memory limits, connection limits, persistence) live in the running process, not only in a config file — and they can be read live from the client.
## 2
CONFIG GET param prints the parameter name and its current value. Store the value with SET.
## 3
`redis-cli CONFIG GET maxclients` → 4321, then `redis-cli SET audit:maxclients 4321`
