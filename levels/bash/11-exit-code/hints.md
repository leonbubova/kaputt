## 1
A number is even when the remainder of dividing by 2 is zero.
## 2
Arithmetic: `$(( n % 2 ))`. Compare it with `[ ... -eq 0 ]`.
## 3
`if [ $((n % 2)) -eq 0 ]; then echo even; exit 0; else echo odd; exit 1; fi`
