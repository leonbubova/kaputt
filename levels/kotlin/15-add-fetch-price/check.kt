import kotlinx.coroutines.runBlocking

object WgCheck {
    @JvmStatic fun main(args: Array<String>) {
        val t0 = System.currentTimeMillis()
        val a1 = Wg.attempt("fetchPrice(A1)") { runBlocking { fetchPrice("A1") } }
        val took = System.currentTimeMillis() - t0
        Wg.expectEq(a1, 2099, "fetchPrice(A1)")
        Wg.expect(took >= 150, "fetchPrice should delay(200) like a network call, took only $took ms")
        Wg.expectEq(runBlocking { fetchPrice("E5") }, 999, "fetchPrice(E5)")
        val threw = try { runBlocking { fetchPrice("ZZ") }; false } catch (e: IllegalArgumentException) { true }
        Wg.expect(threw, "fetchPrice(ZZ) should throw IllegalArgumentException")
        Wg.done("suspend fun fetchPrice works")
    }
}
