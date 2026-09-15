import kotlinx.coroutines.runBlocking

object WgCheck {
    @JvmStatic fun main(args: Array<String>) {
        val prices = Wg.attempt("fetchAll with a bad sku") { runBlocking { fetchAll(listOf("A1", "ZZ", "B2")) } } ?: emptyMap()
        Wg.expectEq(prices, mapOf("A1" to 2099, "B2" to 449), "valid prices survive an unknown sku")
        val threw = try { runBlocking { fetchPrice("ZZ") }; false } catch (e: IllegalArgumentException) { true }
        Wg.expect(threw, "fetchPrice(ZZ) itself must still throw")
        Wg.expectEq(runBlocking { fetchAll(listOf("D4", "E5")) }, mapOf("D4" to 250, "E5" to 999), "fetchAll without bad skus")
        Wg.done("fetchAll() tolerates a failing child")
    }
}
