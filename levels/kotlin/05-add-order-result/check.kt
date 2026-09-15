object WgCheck {
    @JvmStatic fun main(args: Array<String>) {
        val inv = seedInventory()
        val ok = inv.order("A1", 2)
        Wg.expect(ok is OrderResult.Ok, "order(A1, 2) should be Ok, got $ok")
        if (ok is OrderResult.Ok) { Wg.expectEq(ok.product.sku, "A1", "Ok.product"); Wg.expectEq(ok.qty, 2, "Ok.qty") }
        Wg.expectEq(inv.find("A1")?.stock, 10, "stock after order")
        Wg.expect(inv.log.any { it.contains("A1") }, "log should mention the order")
        val ins = inv.order("B2", 5)
        Wg.expect(ins is OrderResult.Insufficient && ins.available == 3, "order(B2, 5) should be Insufficient(available=3), got $ins")
        Wg.expectEq(inv.find("B2")?.stock, 3, "stock untouched after Insufficient")
        val back = inv.order("C3", 1)
        Wg.expect(back is OrderResult.Backordered && back.eta == "2 weeks", "order(C3, 1) should be Backordered, got $back")
        Wg.expect(inv.order("nope", 1) is OrderResult.Unknown, "order(nope) should be Unknown")
        Wg.done("order() returns a sealed OrderResult")
    }
}
