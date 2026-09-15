## 1
A return type ending in `?` means "may be null": `fun find(sku: String): Product?`. Callers then must deal with it (`?.`, `?:`). `Map.get(key)` / `map[key]` already returns `V?` — null when the key is missing — so it is the whole implementation.
## 2
The map is `products` (private, keyed by normalized sku). Run the key through `normalize(sku)` before indexing.
## 3
```
// src/Inventory.kt, inside class Inventory
fun find(sku: String): Product? = products[normalize(sku)]
```
