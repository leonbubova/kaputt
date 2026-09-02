## 1
A comparison operator carries two decisions at once: whether the boundary counts (strict vs inclusive) and whether it compares numbers or text. Two separate bugs here. First: `10 1 10` should be yes but isn't — look at the comparison operators' strictness.
## 2
`>` and `<` in `[[ ]]` are exclusive AND compare strings, so "9" < "100" is false. You need inclusive, numeric tests.
## 3
`[ "$1" -ge "$2" ] && [ "$1" -le "$3" ]` — `-ge`/`-le` are inclusive and numeric.
