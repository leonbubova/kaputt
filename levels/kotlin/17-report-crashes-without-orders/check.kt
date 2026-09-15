object WgCheck {
    @JvmStatic fun main(args: Array<String>) {
        Wg.expectEq(Wg.attempt("topSeller(empty)") { topSeller(emptyList()) }, null, "topSeller(emptyList())")
        val ada = Customer("ada@example.com", "Ada")
        val orders = listOf(Order("A1", 2, ada), Order("B2", 5, ada), Order("A1", 1, ada), Order("C3", 4, ada))
        Wg.expectEq(topSeller(orders), "B2", "topSeller with orders")
        Wg.done("topSeller() is null-safe on empty input")
    }
}
