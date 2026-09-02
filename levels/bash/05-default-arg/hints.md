## 1
An unset `$1` just expands to nothing — bash substitutes no fallback unless you ask, and it has a built-in expansion form for exactly that. You need a default value for `$1` when it is unset.
## 2
Parameter expansion `${1:-world}` yields `world` when `$1` is empty or unset.
## 3
`name=${1:-world}; printf 'hello, %s\n' "$name"`
