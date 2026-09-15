## 1
Two symptoms, two places. Chase each from its own error: `null` means `find()` failed → `normalize()`; "no discount" → `discount()`. Print intermediate values in `./run.sh` (`normalize(" a1 ")`, `discount(1000, 25)`).
## 2
`normalize` uses `apply` (returns the receiver, not the result). `discount` divides `percent / 100` before multiplying (integer division → 0). You fixed both patterns before.
## 3
```
fun normalize(sku: String): String = sku.trim().uppercase()                     // Inventory.kt
fun discount(priceCents: Int, percent: Int = 10): Int = priceCents - priceCents * percent / 100   // Money.kt
```
