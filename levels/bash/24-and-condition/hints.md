## 1
You have written each test on its own before: a numeric comparison in `[ ]` and a remainder check with `$(( ))`. What's new is asking for both at once.
## 2
`A && B` runs B only if A succeeded, and the whole thing succeeds only when both do — so `if [ … ] && [ … ]; then` needs both tests to pass.
## 3
`if [ "$1" -gt 0 ] && [ $(($1 % 2)) -eq 0 ]; then echo yes; else echo no; fi`
