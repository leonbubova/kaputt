## 1
`first()`, `last()`, `single()`, `max()` throw on an empty collection. Every one of them has an `…OrNull` twin that returns null instead. The stack trace says which call and where.
## 2
`topSeller` already declares `String?` — the return type is ready for null, the call inside is not. Look at the chain in `src/Report.kt`.
## 3
```
// src/Report.kt → topSeller
….sortedByDescending { it.value }.firstOrNull()?.key
```
