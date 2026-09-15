// price sync against the (simulated) supplier feed — every lookup takes ~200 ms
import kotlinx.coroutines.delay

val PRICE_FEED = mapOf("A1" to 2099, "B2" to 449, "C3" to 11900, "D4" to 250, "E5" to 999)

suspend fun fetchPrice(sku: String): Int {
    delay(200)
    return PRICE_FEED[sku] ?: throw IllegalArgumentException("unknown sku $sku")
}
