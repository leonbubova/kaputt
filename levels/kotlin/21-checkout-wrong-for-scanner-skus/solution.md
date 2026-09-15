Two causes: `normalize` uses `apply` and returns the raw sku (lookup fails); `discount` computes `(percent / 100)` = 0.
    src/Inventory.kt → sku.trim().uppercase() · src/Money.kt → priceCents * percent / 100
