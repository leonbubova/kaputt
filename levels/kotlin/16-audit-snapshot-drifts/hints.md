## 1
A read-only `List`/`Collection` is not a copy — it is a *view*. `map.values` is a live window onto the map: every later write shows up in it. Compare what `snapshot()` returns in `src/Inventory.kt` with what `all()` does.
## 2
`toList()` (or `map { it }`) materialises the elements into a new list that nobody else holds.
## 3
```
// src/Inventory.kt
fun snapshot(): List<Product> = products.values.toList()
```
