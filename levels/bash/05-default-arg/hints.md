## 1
You need a default value for `$1` when it is unset.
## 2
Parameter expansion `${1:-world}` yields `world` when `$1` is empty or unset.
## 3
`name=${1:-world}; printf 'hello, %s\n' "$name"`
