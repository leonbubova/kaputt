## 1
A task is addressed by its `id` string, not by its export name. `grep -rn 'id:' src/trigger`.
## 2
Two files register the same id `process-order`; the last one indexed wins and the other silently disappears.
## 3
In `src/trigger/process-refund.ts` set `id: "process-refund"`.
