## 1
A loop's condition is tested *before* each round, so the operator on the boundary decides whether the last value gets printed or skipped. Print what the loop does: it stops one step early, at 2.
## 2
`-gt 1` stops as soon as i is not greater than 1, i.e. before printing 1.
## 3
Use `-ge 1` (or `-gt 0`) so 1 is included.
