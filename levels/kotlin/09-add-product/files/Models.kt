// domain types — data classes get ==, copy() and toString() for free

data class Customer(val email: String, val name: String)

data class Order(val sku: String, val qty: Int, val customer: Customer)
