## 1
`Product` is immutable: its properties are `val`, and `copy()` returns a *new* object — the original never changes. A `copy()` whose result is not stored anywhere is a no-op. Compare `restock()` with `order()` in `src/Inventory.kt`.
## 2
The map still holds the old product. The new copy has to be written back under its key.
## 3
```
// src/Inventory.kt → restock()
products[p.sku] = p.copy(stock = p.stock + qty)
```
