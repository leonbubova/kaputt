# how much memory does Redis use? INFO memory
Lesson: everything lives in RAM, so the first question on any Redis server is "how full is it?". `INFO` prints
the server's status as `name:value` lines, grouped in sections; `INFO memory` shows only the memory section:
    used_memory_human:1.02M       what the data takes right now, human readable
    used_memory:1069384           the same in bytes
    maxmemory:0                   the limit in bytes — 0 means no limit (Redis grows until the machine is full)
    maxmemory_policy:noeviction   what happens at the limit: refuse writes, or throw old keys out
Every line is `name:value` with a colon and no spaces. Numbers here are text — you can store them in a key like
any other value, which is how audits are recorded.
Try it:
    wg shell
    INFO memory
    SET big:1 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    INFO memory
Compare `used_memory` before and after — it grew.
Your task: read the number after `maxmemory:` from `INFO memory` and store exactly that number as a string
under the key `audit:maxmemory`.
Where: inside `wg shell`.
Check yourself:  wg check      stuck?  wg hint
