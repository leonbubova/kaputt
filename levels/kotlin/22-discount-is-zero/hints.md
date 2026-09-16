## 1
`Int / Int` is integer division: `25 / 100` is `0`, not `0.25`. Whatever is multiplied by that afterwards is 0 too. Evaluate the expression in `discount()` by hand with percent = 25.
## 2
Multiply before you divide: `priceCents * percent / 100` — the product is still an Int large enough that dividing by 100 keeps the cents. The parentheses moved the division first.
## 3
```
// src/Money.kt
fun discount(priceCents: Int, percent: Int = 10): Int = priceCents - priceCents * percent / 100
```
