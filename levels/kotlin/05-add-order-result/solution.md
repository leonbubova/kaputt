`sealed class OrderResult` with four data-class subtypes in `Models.kt`; `Inventory.order` returns `Unknown` via `?: return`, then a `when` over stock, writing `p.copy(stock = …)` back into the map.
