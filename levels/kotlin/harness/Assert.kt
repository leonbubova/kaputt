// shared by every level's check.kt — compiled together with the player's src/
object Wg {
    private var failed = false
    fun expect(cond: Boolean, msg: String) { if (!cond) { println("[31m✘ $msg[0m"); failed = true } }
    fun expectEq(actual: Any?, expected: Any?, what: String) = expect(actual == expected, "$what: expected $expected, got $actual")
    fun <T> attempt(what: String, block: () -> T): T? = try { block() } catch (e: Throwable) { expect(false, "$what threw ${e::class.simpleName}: ${e.message?.take(120)}"); null }
    fun done(msg: String) { if (failed) kotlin.system.exitProcess(1); println("[32m✔ $msg[0m") }
}
