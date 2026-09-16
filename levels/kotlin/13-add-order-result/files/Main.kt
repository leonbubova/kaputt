// demo flow: ./run.sh — walks through the whole domain so a broken piece shows up here

fun main() {
    val inv = seedInventory()
    println("== stock");     println(stockReport(inv))
    println("== describe");  println(inv.describe("A1")); println(inv.describe("nope"))
    val ada = Customer("ada@example.com", "Ada"); val linus = Customer("linus@example.com", "Linus")
    val orders = listOf(Order("A1", 2, ada), Order("B2", 1, linus), Order("C3", 1, ada), Order(" a1 ", 1, Customer("ada@example.com", "Ada")))
    println("== restock");   inv.restock("B2", 10); println(inv.describe("B2"))
    println("== customers"); println(customers(orders).joinToString { it.email })
    println("== top seller"); println(topSeller(orders)); println(topSeller(emptyList()))
    println("== checkout");  println(checkout(inv, Order("A1", 3, ada), percent = 25)?.toEuro()); println(checkout(inv, Order(" a1 ", 1, ada))?.toEuro())
    println("== money");     println(1999.toEuro()); println(discount(1000, 25))
}
