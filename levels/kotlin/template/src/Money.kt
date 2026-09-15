// money helpers — prices are Int cents everywhere, formatted only at the edge
fun Int.toEuro(): String = "€%d.%02d".format(this / 100, this % 100)

// price after a percentage discount (default 10 %), still in cents
fun discount(priceCents: Int, percent: Int = 10): Int = priceCents - priceCents * percent / 100
