object WgCheck {
    @JvmStatic fun main(args: Array<String>) {
        Wg.expectEq(stockLabel(0), "sold out", "stockLabel(0)")
        Wg.expectEq(stockLabel(1), "low", "stockLabel(1)")
        Wg.expectEq(stockLabel(4), "low", "stockLabel(4)")
        Wg.expectEq(stockLabel(5), "ok", "stockLabel(5)")
        Wg.expectEq(stockLabel(40), "ok", "stockLabel(40)")
        Wg.done("stockLabel() decides with if / else if / else")
    }
}
