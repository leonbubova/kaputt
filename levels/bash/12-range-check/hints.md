## 1
Two separate bugs. First: `10 1 10` should be yes but isn't — look at the comparison operators' strictness.
## 2
`>` and `<` in `[[ ]]` are exclusive AND compare strings, so "9" < "100" is false. You need inclusive, numeric tests.
## 3
`[ "$1" -ge "$2" ] && [ "$1" -le "$3" ]` — `-ge`/`-le` are inclusive and numeric.
