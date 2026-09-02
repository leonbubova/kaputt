## 1
Bash never complains about a variable that does not exist — a misspelled name silently expands to nothing, so the output looks fine minus the value. Compare the variable that is assigned with the one that is printed.
## 2
`TOTAL` is set, but the echo reads `$TOTL` — an undefined (empty) variable.
## 3
Fix the name: `echo "total: $TOTAL"`.
