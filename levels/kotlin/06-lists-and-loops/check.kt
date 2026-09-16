object WgCheck {
    @JvmStatic fun main(args: Array<String>) {
        Wg.expectEq(total(listOf(1999, 499, 250)), 2748, "total(1999, 499, 250)")
        Wg.expectEq(total(emptyList()), 0, "total of an empty list")
        Wg.expectEq(total(listOf(5)), 5, "total of one price")
        Wg.done("total() sums a list")
    }
}
