## 1
`fun parseQty(text: String): Int?` — the `?` in the return type allows null. `text.toIntOrNull()` is already exactly that.
## 2
`qtyOrZero` calls `parseQty(text)` and adds the fallback: `?: 0`. Its return type is plain `Int`, because after `?:` it can no longer be null.
## 3
```
fun parseQty(text: String): Int? = text.toIntOrNull()
fun qtyOrZero(text: String): Int = parseQty(text) ?: 0
```
