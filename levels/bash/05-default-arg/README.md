# ${1:-fallback}: give a variable a default
Lesson: an argument that was not passed is simply empty. Bash does not warn, `$1` expands to nothing, and your script prints `hello, ` with a hole in it.
Parameter expansion is the family of `${…}` forms that transform a variable while reading it. The most used one is the default: `${1:-world}` means "the value of `$1`, or `world` if `$1` is unset or empty". The variable itself stays untouched.
The same form works for any variable — `${NAME:-guest}`, `${PORT:-8080}` — and is how scripts take optional arguments and optional environment variables without an `if`.
    ${1:-world}                     $1, or world when missing
    name=${1:-world}                store the result once, use "$name" after
    ${VAR:=x}                       like :- but also assigns the default to VAR
Try it first: `unset x; echo "${x:-empty}"; x=5; echo "${x:-empty}"`.
Your task: reuse the greeter idea, but make it friendly: `greet2.sh [name]` greets the given name, and falls back to `world` when called with no argument.
Goal: `greet2.sh` prints `hello, world`; `greet2.sh Bob` prints `hello, Bob`.
Check yourself:  wg check      stuck?  wg hint
