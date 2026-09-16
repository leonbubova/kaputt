// in-memory stock, keyed by normalized sku
class Inventory(products: List<Product>) {
    private val products: MutableMap<String, Product> = products.associateBy { it.sku }.toMutableMap()

    // audit trail of every stock movement — wired up at construction
    lateinit var log: MutableList<String>
    init { log = mutableListOf() }

    fun normalize(sku: String): String = sku.apply { trim().uppercase() }

    fun find(sku: String): Product? = products[normalize(sku)]

    fun describe(sku: String): String {
        val p = find(sku) ?: return "unknown sku $sku"
        return "${p.name} (${p.stock} in stock)"
    }

    fun order(sku: String, qty: Int): OrderResult {
        val p = find(sku) ?: return OrderResult.Unknown(sku)
        return when {
            p.stock == 0 -> OrderResult.Backordered(p.sku, "2 weeks")
            qty > p.stock -> OrderResult.Insufficient(p.sku, p.stock)
            else -> {
                products[p.sku] = p.copy(stock = p.stock - qty)
                log.add("order ${p.sku} x$qty")
                OrderResult.Ok(p, qty)
            }
        }
    }

    fun restock(sku: String, qty: Int) {
        val p = find(sku) ?: return
        products[p.sku] = p.copy(stock = p.stock + qty)
        log.add("restock ${p.sku} +$qty")
    }

    // products below the threshold, emptiest first
    fun lowStock(threshold: Int = 5): List<Product> = products.values.filter { it.stock < threshold }.sortedBy { it.stock }

    // point-in-time copy for the audit report — must not change afterwards
    fun snapshot(): List<Product> = products.values.toList()

    fun all(): List<Product> = products.values.sortedBy { it.sku }
}

fun seedInventory(): Inventory = Inventory(listOf(
    Product("A1", "cable", 1999, 12),
    Product("B2", "adapter", 499, 3),
    Product("C3", "monitor", 12900, 0),
    Product("D4", "sticker", 250, 40),
    Product("E5", "mouse", 899, 1),
))
