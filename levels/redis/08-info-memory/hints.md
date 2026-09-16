## 1
INFO memory prints name:value lines. Find the line starting with `maxmemory:` (not maxmemory_human, not maxmemory_policy). The number after the colon is the value to record.
## 2
`SET audit:maxmemory <that number>` — on this fresh server the line reads `maxmemory:0`.
## 3
    wg shell
    INFO memory
    SET audit:maxmemory 0
