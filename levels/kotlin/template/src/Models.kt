// domain types — data classes get ==, copy() and toString() for free
data class Product(val sku: String, val name: String, val priceCents: Int, val stock: Int)

data class Customer(val email: String, val name: String)

data class Order(val sku: String, val qty: Int, val customer: Customer)

// every possible outcome of Inventory.order() — `when` over it is exhaustive
sealed class OrderResult {
    data class Ok(val product: Product, val qty: Int) : OrderResult()
    data class Insufficient(val sku: String, val available: Int) : OrderResult()
    data class Backordered(val sku: String, val eta: String) : OrderResult()
    data class Unknown(val sku: String) : OrderResult()
}
