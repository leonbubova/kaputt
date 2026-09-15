object WgCheck {
    @JvmStatic fun main(args: Array<String>) {
        val inv = seedInventory()
        val d = Wg.attempt("describe(nope)") { inv.describe("nope") }
        Wg.expect(d?.contains("unknown") == true, "describe(nope) should say unknown, got $d")
        val a = inv.describe("A1")
        Wg.expect(a.contains("cable") && a.contains("12"), "describe(A1) should contain name and stock, got $a")
        Wg.done("describe() handles a missing product")
    }
}
