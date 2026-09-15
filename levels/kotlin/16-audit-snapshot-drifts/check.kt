object WgCheck {
    @JvmStatic fun main(args: Array<String>) {
        val inv = seedInventory()
        val snap = inv.snapshot()
        inv.order("D4", 5); inv.restock("B2", 7)
        Wg.expectEq(snap.first { it.sku == "D4" }.stock, 40, "snapshot D4 stock after a later order")
        Wg.expectEq(snap.first { it.sku == "B2" }.stock, 3, "snapshot B2 stock after a later restock")
        Wg.expectEq(inv.find("D4")?.stock, 35, "live stock did change")
        Wg.expectEq(snap.size, 5, "snapshot size")
        Wg.done("snapshot() is a real copy")
    }
}
