object WgCheck {
    @JvmStatic fun main(args: Array<String>) {
        val b = describe(OrderResult.Backordered("C3", "2 weeks"))
        Wg.expect(b.contains("backordered") && b.contains("2 weeks"), "Backordered should be described, got: $b")
        Wg.expect(describe(OrderResult.Unknown("ZZ")).contains("unknown"), "Unknown still described")
        Wg.expect(describe(OrderResult.Insufficient("B2", 3)).contains("3"), "Insufficient still described")
        Wg.expect(describe(OrderResult.Ok(Product("A1", "cable", 1999, 12), 2)).contains("cable"), "Ok still described")
        Wg.done("describe() is exhaustive over OrderResult")
    }
}
