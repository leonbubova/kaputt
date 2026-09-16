// domain types — data classes get ==, copy() and toString() for free
data class Product(val sku: String, val name: String, val priceCents: Int, val stock: Int)

data class Customer(val email: String, val name: String)

data class Order(val sku: String, val qty: Int, val customer: Customer)
