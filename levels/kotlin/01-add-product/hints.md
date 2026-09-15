## 1
A Kotlin class declared as `data class X(val a: Int, val b: String)` gets `equals`/`hashCode`, `toString` and `copy()` generated from its constructor properties. A plain `class` compares by identity — two equal-looking objects are `!=`. Look at `Customer` in `src/Models.kt` for the shape.
## 2
Properties are declared in the primary constructor: `val sku: String`. `priceCents` and `stock` are `Int`. Nothing else is needed — no getters, no equals.
## 3
```
// src/Models.kt
data class Product(val sku: String, val name: String, val priceCents: Int, val stock: Int)
```
