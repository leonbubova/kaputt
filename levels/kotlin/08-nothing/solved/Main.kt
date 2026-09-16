fun parseQty(text: String): Int? = text.toIntOrNull()

fun qtyOrZero(text: String): Int = parseQty(text) ?: 0

fun main() {
    println(qtyOrZero("12"))
    println(qtyOrZero("twelve"))
}
