`describe()` does `find(sku)!!` — `!!` throws on null instead of handling it.
    src/Inventory.kt → val p = find(sku) ?: return "unknown sku $sku"
