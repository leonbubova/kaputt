import kotlinx.coroutines.runBlocking

object WgCheck {
    @JvmStatic fun main(args: Array<String>) {
        val skus = listOf("A1", "B2", "C3", "D4", "E5")
        val t0 = System.currentTimeMillis()
        val prices = Wg.attempt("fetchAll") { runBlocking { fetchAll(skus) } } ?: emptyMap()
        val took = System.currentTimeMillis() - t0
        Wg.expectEq(prices.size, 5, "all 5 prices")
        Wg.expect(took < 600, "5 fetches should overlap (~200 ms), took $took ms")
        val partial = Wg.attempt("fetchAll with a bad sku") { runBlocking { fetchAll(listOf("A1", "ZZ", "B2")) } } ?: emptyMap()
        Wg.expectEq(partial, mapOf("A1" to 2099, "B2" to 449), "valid prices survive an unknown sku")
        val threw = try { runBlocking { fetchPrice("ZZ") }; false } catch (e: IllegalArgumentException) { true }
        Wg.expect(threw, "fetchPrice(ZZ) itself must still throw")
        Wg.done("fetchAll() is concurrent and fault-tolerant")
    }
}
