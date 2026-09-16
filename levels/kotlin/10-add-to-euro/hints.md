## 1
An extension function adds a method to an existing type without touching it: `fun Int.toEuro(): String = …` — inside, `this` is the Int. Any file in the project can call `1999.toEuro()` afterwards.
## 2
Euros are `this / 100`, cents `this % 100`. The cents need zero-padding: `"%02d".format(5)` gives `05`. Strings can be built with a template `"€$euros.$cents"` or with `String.format`.
## 3
```
// src/Money.kt
fun Int.toEuro(): String = "€%d.%02d".format(this / 100, this % 100)
```
