// money helpers — prices are Int cents everywhere, formatted only at the edge
fun Int.toEuro(): String = "€%d.%02d".format(this / 100, this % 100)
