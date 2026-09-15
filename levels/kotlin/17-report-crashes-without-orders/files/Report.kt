// text reports for the daily stock mail
fun stockReport(inv: Inventory): String =
    inv.all().joinToString("\n") { p -> "${p.sku}  ${p.name.padEnd(10)} ${p.priceCents.toEuro()}  stock=${p.stock}" }

fun describe(result: OrderResult): String = when (result) {
    is OrderResult.Ok -> "ok: ${result.qty} x ${result.product.name}"
    is OrderResult.Insufficient -> "only ${result.available} of ${result.sku} left"
    is OrderResult.Backordered -> "${result.sku} backordered, eta ${result.eta}"
    is OrderResult.Unknown -> "unknown sku ${result.sku}"
}

// every customer that ordered, once, sorted by mail
fun customers(orders: List<Order>): List<Customer> = orders.map { it.customer }.distinct().sortedBy { it.email }

// sku with the most units ordered, null when there are no orders yet
fun topSeller(orders: List<Order>): String? =
    orders.groupBy { it.sku }.mapValues { (_, os) -> os.sumOf { it.qty } }.entries.sortedByDescending { it.value }.first().key

// total in cents for one order line after the discount, null for an unknown sku
fun checkout(inv: Inventory, order: Order, percent: Int = 0): Int? {
    val p = inv.find(order.sku) ?: return null
    return discount(p.priceCents * order.qty, percent)
}
