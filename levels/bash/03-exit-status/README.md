# the deploy gate needs a placeholder that always fails
"Until the real health check lands, CI should run `notready.sh`: it prints `not ready` and exits with code 3 — not 1, not 0 — so the dashboard can tell it apart from a crash."
Goal: `notready.sh` prints `not ready` and `echo $?` right after it shows `3`.
