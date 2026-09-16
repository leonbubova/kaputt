object WgCheck {
    @JvmStatic fun main(args: Array<String>) {
        Wg.expectEq(parseQty("12"), 12, "parseQty(\"12\")")
        Wg.expectEq(parseQty("twelve"), null, "parseQty(\"twelve\")")
        Wg.expectEq(qtyOrZero("7"), 7, "qtyOrZero(\"7\")")
        Wg.expectEq(qtyOrZero("many"), 0, "qtyOrZero(\"many\")")
        Wg.done("nullable Int? with a fallback")
    }
}
