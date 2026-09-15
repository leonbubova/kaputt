object WgCheck {
    @JvmStatic fun main(args: Array<String>) {
        val p = Product("A1", "cable", 1999, 12)
        Wg.expectEq(p.sku, "A1", "sku"); Wg.expectEq(p.name, "cable", "name"); Wg.expectEq(p.priceCents, 1999, "priceCents"); Wg.expectEq(p.stock, 12, "stock")
        Wg.expectEq(p, Product("A1", "cable", 1999, 12), "structural equality")
        Wg.expectEq(p.copy(stock = 3), Product("A1", "cable", 1999, 3), "copy(stock = 3)")
        Wg.expect(p.toString().contains("sku=A1"), "toString should list the fields")
        Wg.done("Product is a data class with sku/name/priceCents/stock")
    }
}
