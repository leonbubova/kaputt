# the batch splitter only accepts positive even sizes
"Write `batchok.sh N`: print `yes` when N is greater than 0 AND even, otherwise `no`. Both conditions must hold — `0` and `-4` are even but not positive, `3` is positive but odd."
Goal: `batchok.sh 8` → `yes`; `batchok.sh 3`, `batchok.sh 0`, `batchok.sh -4` → `no`.
