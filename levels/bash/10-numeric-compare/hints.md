## 1
Inside `[[ ]]`, `>` compares strings, not numbers. As strings, "9" sorts after "100".
## 2
Numeric comparison uses `-gt`, `-lt`, `-ge`, `-le` inside `[ ... ]`.
## 3
`if [ "$1" -gt "$2" ]; then echo "$1"; else echo "$2"; fi`
