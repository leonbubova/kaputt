## 1
`suspend fun` marks a function that may pause without blocking a thread — `delay(ms)` is such a pause and can only be called from a suspend function or a coroutine. `kotlinx.coroutines` is already on the classpath; `import kotlinx.coroutines.delay`.
## 2
Look the sku up in `PRICE_FEED` (a Map, so `PRICE_FEED[sku]` is `Int?`). `?: throw IllegalArgumentException("unknown sku $sku")` turns the null into the exception the ticket asks for.
## 3
```
// src/Prices.kt
import kotlinx.coroutines.delay
suspend fun fetchPrice(sku: String): Int {
    delay(200)
    return PRICE_FEED[sku] ?: throw IllegalArgumentException("unknown sku $sku")
}
```
