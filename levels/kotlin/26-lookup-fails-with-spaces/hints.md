## 1
Scope functions differ in what they *return*: `let`/`run` return the lambda's result, `apply`/`also` return the receiver itself. Strings are immutable, so `trim().uppercase()` computes a new string — inside `apply` that new string is thrown away.
## 2
Print `normalize(" a1 ")` — it comes back unchanged. Open `normalize()` in `src/Inventory.kt`.
## 3
```
// src/Inventory.kt
fun normalize(sku: String): String = sku.trim().uppercase()      // or sku.let { it.trim().uppercase() }
```
