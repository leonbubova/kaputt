// demo flow: ./run.sh — walks through the whole domain so a broken piece shows up here

fun main() {
    val inv = seedInventory()
    println("== stock");     println(stockReport(inv))
    val ada = Customer("ada@example.com", "Ada"); val linus = Customer("linus@example.com", "Linus")
    val orders = listOf(Order("A1", 2, ada), Order("B2", 1, linus), Order("C3", 1, ada), Order(" a1 ", 1, Customer("ada@example.com", "Ada")))
    println("== customers"); println(customers(orders).joinToString { it.email })
    println("== top seller"); println(topSeller(orders)); println(topSeller(emptyList()))
    println("== money");     println(1999.toEuro()); println(discount(1000, 25))
}
