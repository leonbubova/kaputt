## 1
`NullPointerException` in Kotlin almost always comes from one operator: `!!`. It says "I promise this is not null" — and throws when the promise is broken. Run `./run.sh` and look at the stack trace: it names the line.
## 2
`find()` is declared `Product?` on purpose: an unknown sku *is* null. `!!` throws it away; `?:` (the elvis operator) gives it a meaning: `val p = find(sku) ?: return "unknown sku $sku"`.
## 3
```
// src/Inventory.kt → describe()
val p = find(sku) ?: return "unknown sku $sku"
```
