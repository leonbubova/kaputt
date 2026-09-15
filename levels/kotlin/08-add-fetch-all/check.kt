import kotlinx.coroutines.runBlocking

object WgCheck {
    @JvmStatic fun main(args: Array<String>) {
        val skus = listOf("A1", "B2", "C3", "D4", "E5")
        val t0 = System.currentTimeMillis()
        val prices = Wg.attempt("fetchAll") { runBlocking { fetchAll(skus) } } ?: emptyMap()
        val took = System.currentTimeMillis() - t0
        Wg.expectEq(prices, mapOf("A1" to 2099, "B2" to 449, "C3" to 11900, "D4" to 250, "E5" to 999), "fetchAll result")
        Wg.expect(took < 600, "5 fetches should overlap (~200 ms), took $took ms — are they running one after another?")
        Wg.done("fetchAll() runs the fetches concurrently")
    }
}
