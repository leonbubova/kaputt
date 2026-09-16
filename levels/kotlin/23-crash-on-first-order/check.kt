object WgCheck {
    @JvmStatic fun main(args: Array<String>) {
        val inv = seedInventory()
        val r = Wg.attempt("order(A1, 1)") { inv.order("A1", 1) }
        Wg.expect(r is OrderResult.Ok, "order(A1, 1) should be Ok, got $r")
        Wg.attempt("restock(B2, 2)") { inv.restock("B2", 2) }
        val log = Wg.attempt("reading log") { inv.log } ?: emptyList()
        Wg.expect(log.any { it.contains("order A1") } && log.any { it.contains("restock B2") }, "log should contain both movements, got $log")
        Wg.done("log is initialised before use")
    }
}
