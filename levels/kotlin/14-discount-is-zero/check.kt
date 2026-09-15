object WgCheck {
    @JvmStatic fun main(args: Array<String>) {
        Wg.expectEq(discount(1000, 25), 750, "discount(1000, 25)")
        Wg.expectEq(discount(1000), 900, "discount(1000)")
        Wg.expectEq(discount(999, 10), 900, "discount(999, 10)")
        Wg.expectEq(discount(5997, 25), 4498, "discount(5997, 25)")
        Wg.done("discount() no longer divides first")
    }
}
