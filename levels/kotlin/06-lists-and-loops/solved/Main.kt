fun total(prices: List<Int>): Int {
    var sum = 0
    for (p in prices) {
        sum += p
    }
    return sum
}

fun main() {
    val prices = listOf(1999, 499, 250)
    println(total(prices))
}
