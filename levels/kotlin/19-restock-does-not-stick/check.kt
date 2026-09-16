object WgCheck {
    @JvmStatic fun main(args: Array<String>) {
        val inv = seedInventory()
        inv.restock("B2", 10)
        Wg.expectEq(inv.find("B2")?.stock, 13, "stock after restock(B2, 10)")
        Wg.expect(inv.log.any { it.contains("restock") }, "log should record the restock")
        inv.restock("nope", 1)
        Wg.expectEq(inv.all().size, 5, "restock of unknown sku must not add anything")
        Wg.done("restock() persists the new stock")
    }
}
