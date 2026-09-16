object WgCheck {
    @JvmStatic fun main(args: Array<String>) {
        val inv = seedInventory()
        Wg.expectEq(inv.find("A1")?.name, "cable", "find(\"A1\")?.name")
        Wg.expectEq(inv.find("nope"), null, "find(\"nope\")")
        Wg.expectEq(inv.find(" a1 ")?.sku, "A1", "find(\" a1 \") via normalize")
        Wg.expectEq(inv.find("e5")?.stock, 1, "find(\"e5\")?.stock")
        Wg.done("find() returns Product?")
    }
}
