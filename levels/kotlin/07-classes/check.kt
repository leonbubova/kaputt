object WgCheck {
    @JvmStatic fun main(args: Array<String>) {
        Wg.expectEq(describe(Product("cable", 12)), "cable: 12 in stock", "describe(cable)")
        Wg.expectEq(describe(Product("mouse", 1)), "mouse: 1 in stock", "describe(mouse)")
        Wg.done("describe() reads the parts of an object")
    }
}
