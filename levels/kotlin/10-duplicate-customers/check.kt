object WgCheck {
    @JvmStatic fun main(args: Array<String>) {
        val ada = Customer("ada@example.com", "Ada")
        Wg.expectEq(ada, Customer("ada@example.com", "Ada"), "two Customers with the same fields")
        val orders = listOf(Order("A1", 1, ada), Order("B2", 1, Customer("ada@example.com", "Ada")), Order("C3", 1, Customer("linus@example.com", "Linus")), Order("D4", 1, Customer("ada@example.com", "Ada")))
        Wg.expectEq(customers(orders).map { it.email }, listOf("ada@example.com", "linus@example.com"), "customers() deduplicated")
        Wg.done("Customer compares by value again")
    }
}
