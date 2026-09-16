object WgCheck {
    @JvmStatic fun main(args: Array<String>) {
        Wg.expectEq(1999.toEuro(), "€19.99", "1999.toEuro()")
        Wg.expectEq(5.toEuro(), "€0.05", "5.toEuro()")
        Wg.expectEq(12900.toEuro(), "€129.00", "12900.toEuro()")
        Wg.expectEq(0.toEuro(), "€0.00", "0.toEuro()")
        Wg.done("Int.toEuro() formats cents")
    }
}
