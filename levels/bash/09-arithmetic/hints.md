## 1
Bash treats everything as text: `echo $1*2` prints the characters, it does not calculate. Arithmetic only happens inside a dedicated expansion.
## 2
`$(( expression ))` evaluates integer math and expands to the result. Variables inside it need no `$`.
## 3
`echo $(( $1 * 2 ))` — write it to double.sh.
