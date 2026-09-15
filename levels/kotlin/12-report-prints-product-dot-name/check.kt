object WgCheck {
    @JvmStatic fun main(args: Array<String>) {
        val r = stockReport(seedInventory())
        Wg.expect(!r.contains("Product("), "report should not print whole Product objects")
        val a1 = r.lines().firstOrNull { it.startsWith("A1") } ?: ""
        Wg.expect(a1.contains("cable") && a1.contains("€19.99") && a1.contains("stock=12"), "A1 row should contain name, euro price and stock, got: $a1")
        Wg.expect(r.lines().size == 5, "one row per product")
        Wg.done("string templates use braces")
    }
}
