object WgCheck {
    @JvmStatic fun main(args: Array<String>) {
        val inv = seedInventory(); val ada = Customer("ada@example.com", "Ada")
        Wg.expectEq(checkout(inv, Order(" a1 ", 3, ada), percent = 25), 4498, "checkout(\" a1 \" x3, 25 %)")
        Wg.expectEq(checkout(inv, Order("A1", 1, ada)), 1999, "checkout(A1 x1, no discount)")
        Wg.expectEq(checkout(inv, Order("b2", 2, ada), percent = 10), 899, "checkout(b2 x2, 10 %)")
        Wg.expectEq(checkout(inv, Order("ZZ", 1, ada)), null, "checkout(unknown) stays null")
        Wg.done("checkout() normalizes and discounts again")
    }
}
