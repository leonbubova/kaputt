`sku.apply { trim().uppercase() }` computes the cleaned string and discards it; `apply` returns the original receiver.
    src/Inventory.kt → sku.trim().uppercase()
