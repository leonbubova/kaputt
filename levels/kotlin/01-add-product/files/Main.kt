// demo flow: ./run.sh
fun main() {
    val ada = Customer("ada@example.com", "Ada")
    val order = Order("A1", 2, ada)
    println("$order")
}
