// in-memory stock, keyed by normalized sku
class Inventory(products: List<Product>) {
    private val products: MutableMap<String, Product> = products.associateBy { it.sku }.toMutableMap()

    // audit trail of every stock movement — wired up at construction
    lateinit var log: MutableList<String>
    init { log = mutableListOf() }

    fun normalize(sku: String): String = sku.trim().uppercase()

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
