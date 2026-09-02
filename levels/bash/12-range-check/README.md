# range check rejects the boundaries and mis-sorts big numbers
"`between.sh N LO HI` prints `yes` when LO ≤ N ≤ HI (inclusive), else `no`. Two complaints: `between.sh 10 1 10` says `no` (should be yes), and `between.sh 9 1 100` says `no` (should be yes). Fix both."
Goal: inclusive bounds AND numeric comparison — see the checks.
