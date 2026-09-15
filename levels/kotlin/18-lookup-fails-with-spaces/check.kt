object WgCheck {
    @JvmStatic fun main(args: Array<String>) {
        val inv = seedInventory()
        Wg.expectEq(inv.normalize(" a1 "), "A1", "normalize(\" a1 \")")
        Wg.expectEq(inv.find(" a1 ")?.sku, "A1", "find(\" a1 \")")
        Wg.expectEq(inv.find("b2")?.name, "adapter", "find(\"b2\")")
        Wg.expectEq(inv.find("A1")?.sku, "A1", "find(\"A1\")")
        Wg.done("normalize() returns the cleaned sku")
    }
}
