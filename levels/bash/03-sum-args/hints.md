## 1
Loop over the arguments with `for n in "$@"`.
## 2
Keep a running total starting at 0 and add each argument with `$(( total + n ))`.
## 3
`total=0; for n in "$@"; do total=$((total+n)); done; echo "$total"`
