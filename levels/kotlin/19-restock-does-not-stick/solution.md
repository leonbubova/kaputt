`restock()` calls `p.copy(stock = …)` and discards the result; data classes are immutable, the map keeps the old product.
    src/Inventory.kt → products[p.sku] = p.copy(stock = p.stock + qty)
