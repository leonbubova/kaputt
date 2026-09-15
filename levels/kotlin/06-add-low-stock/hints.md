## 1
Kotlin collections chain: `list.filter { it.stock < n }.sortedBy { it.stock }` — each step returns a new read-only List, the source is untouched. `it` is the element inside a one-parameter lambda.
## 2
The products live in `products.values` (a `Collection<Product>`). `filter` first, `sortedBy` second; `sortedBy` is ascending, which is exactly "emptiest first".
## 3
```
// src/Inventory.kt, inside class Inventory
fun lowStock(threshold: Int = 5): List<Product> = products.values.filter { it.stock < threshold }.sortedBy { it.stock }
```
