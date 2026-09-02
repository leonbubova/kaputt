## 1
The first positional argument in a script is `$1`.
## 2
`printf '%s\n' "$1"` prints an argument safely. Build the greeting around it.
## 3
`printf 'hello, %s\n' "$1"` — write it to greet.sh and make it executable.
