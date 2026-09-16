`suspend fun fetchPrice(sku: String): Int { delay(200); return PRICE_FEED[sku] ?: throw IllegalArgumentException("unknown sku $sku") }` in `Prices.kt`.
