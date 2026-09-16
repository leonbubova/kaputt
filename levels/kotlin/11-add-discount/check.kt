object WgCheck {
    @JvmStatic fun main(args: Array<String>) {
        Wg.expectEq(discount(1000, 25), 750, "discount(1000, 25)")
        Wg.expectEq(discount(1000), 900, "discount(1000) — default 10 %")
        Wg.expectEq(discount(1000, percent = 50), 500, "named argument percent = 50")
        Wg.expectEq(discount(999, 10), 900, "discount(999, 10) — integer cents")
        Wg.done("discount() with default and named percent")
    }
}
