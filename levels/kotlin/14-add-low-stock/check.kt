object WgCheck {
    @JvmStatic fun main(args: Array<String>) {
        val inv = seedInventory()
        Wg.expectEq(inv.lowStock().map { it.sku }, listOf("C3", "E5", "B2"), "lowStock() default threshold 5")
        Wg.expectEq(inv.lowStock(13).map { it.sku }, listOf("C3", "E5", "B2", "A1"), "lowStock(13), emptiest first")
        Wg.expectEq(inv.lowStock(0), emptyList<Product>(), "lowStock(0)")
        inv.order("A1", 10)
        Wg.expectEq(inv.lowStock().map { it.sku }, listOf("C3", "E5", "A1", "B2"), "lowStock() after an order")
        Wg.done("lowStock() filters and sorts")
    }
}
