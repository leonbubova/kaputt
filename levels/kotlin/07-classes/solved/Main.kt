class Product(val name: String, val stock: Int)

fun describe(p: Product): String {
    return "${p.name}: ${p.stock} in stock"
}

fun main() {
    val cable = Product("cable", 12)
    println(describe(cable))
}
