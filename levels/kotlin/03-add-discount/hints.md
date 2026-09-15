## 1
A parameter can carry a default: `fun f(a: Int, b: Int = 10)`. Callers may skip it, or name it: `f(1, b = 5)`. Named arguments are just how Kotlin calls a function — nothing extra to declare.
## 2
Prices are Int cents. `priceCents * percent / 100` stays an Int and rounds down — that is what the check expects. Return `priceCents` minus that.
## 3
```
// src/Money.kt
fun discount(priceCents: Int, percent: Int = 10): Int = priceCents - priceCents * percent / 100
```
