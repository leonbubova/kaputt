// text reports for the daily stock mail
fun stockReport(inv: Inventory): String =
    inv.all().joinToString("\n") { p -> "${p.sku}  ${p.name.padEnd(10)} ${p.priceCents.toEuro()}  stock=${p.stock}" }

// every customer that ordered, once, sorted by mail
fun customers(orders: List<Order>): List<Customer> = orders.map { it.customer }.distinct().sortedBy { it.email }

// sku with the most units ordered, null when there are no orders yet
fun topSeller(orders: List<Order>): String? =
    orders.groupBy { it.sku }.mapValues { (_, os) -> os.sumOf { it.qty } }.entries.sortedByDescending { it.value }.firstOrNull()?.key
