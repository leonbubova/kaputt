## 1
A key expires only if it was given a countdown. `TTL key` shows the countdown: -1 means none. The task needs a value AND a countdown on `note:temp`.
## 2
Either two commands — `SET note:temp bye` then `EXPIRE note:temp 600` — or one: `SET note:temp bye EX 600`. Check with `TTL note:temp`.
## 3
    wg shell
    SET note:temp bye EX 600
