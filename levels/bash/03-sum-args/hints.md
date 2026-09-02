## 1
A script sees all its arguments as one list, `"$@"` — one word per argument, however many there are. A `for` loop visits them one at a time: `for n in "$@"`.
## 2
Keep a running total starting at 0 and add each argument with `$(( total + n ))`.
## 3
`total=0; for n in "$@"; do total=$((total+n)); done; echo "$total"`
