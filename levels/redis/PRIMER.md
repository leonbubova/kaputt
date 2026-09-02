# redis — the commands you'll actually use
Everything runs in redis-cli (`wg shell`, or `docker exec -it wg-redis redis-cli`). No files, no restarts — just commands.

  KEYS *  /  TYPE key                  what's there / which type a key holds (string, hash, list, set)
  GET k  /  SET k v                    strings — SET k v EX 300 writes value + TTL in one go
  INCR counter                         bump an integer string (errors if the value isn't a number)
  HGETALL k  /  HSET k f1 v1 f2 v2     hash: field/value pairs under one key
  LRANGE k 0 -1  /  RPUSH k a b c      list: read all / append in order (index 0 = first pushed)
  SMEMBERS k  /  SADD k a b c          set: unique members, no order
  TTL k  /  EXPIRE k 3600              seconds left (-1 = never expires, -2 = gone) / add an expiry
  DEL k  /  RENAME old new             remove / move a value to a new key name
  CONFIG GET param  /  CONFIG SET param value    read / change server settings live (maxmemory-policy, appendonly)

Mental model: a key has exactly one type, fixed when it's created. WRONGTYPE = the app expects a list/set/number and the key is something else — you can't convert in place: `DEL` it, rebuild with the right command. Anything that shouldn't live forever needs a TTL; `TTL k` → -1 is the leak.
