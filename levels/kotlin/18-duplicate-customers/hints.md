## 1
`distinct()` uses `equals`/`hashCode`. A plain `class` inherits them from `Any`: identity — every `Customer(...)` you construct is a different object, even with the same fields. Compare `Customer` with `Product` in `src/Models.kt`.
## 2
A `data class` generates `equals`/`hashCode` from its constructor properties. One word was removed.
## 3
```
// src/Models.kt
data class Customer(val email: String, val name: String)
```
