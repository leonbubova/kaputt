class Product(val name: String, val stock: Int)

fun main() {
    val cable = Product("cable", 12)
    println(cable.name)
    println(cable.stock)
}
