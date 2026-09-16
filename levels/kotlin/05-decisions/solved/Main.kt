fun stockLabel(stock: Int): String {
    if (stock == 0) {
        return "sold out"
    } else if (stock < 5) {
        return "low"
    } else {
        return "ok"
    }
}

fun main() {
    println(stockLabel(0))
    println(stockLabel(3))
    println(stockLabel(12))
}
