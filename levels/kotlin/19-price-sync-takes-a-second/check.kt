import kotlinx.coroutines.runBlocking

object WgCheck {
    @JvmStatic fun main(args: Array<String>) {
        val skus = listOf("A1", "B2", "C3", "D4", "E5")
        val t0 = System.currentTimeMillis()
        val prices = Wg.attempt("fetchAll") { runBlocking { fetchAll(skus) } } ?: emptyMap()
        val took = System.currentTimeMillis() - t0
        Wg.expectEq(prices.size, 5, "all 5 prices")
        Wg.expectEq(prices["C3"], 11900, "price C3")
        Wg.expect(took < 600, "5 fetches should overlap (~200 ms), took $took ms")
        Wg.done("fetchAll() is concurrent again")
    }
}
