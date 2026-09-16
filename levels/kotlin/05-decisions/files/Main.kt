fun stockLabel(stock: Int): String {
    if (stock == 0) {
        return "sold out"
    } else {
        return "ok"
    }
}

fun main() {
    println(stockLabel(0))
    println(stockLabel(3))
    println(stockLabel(12))
}
