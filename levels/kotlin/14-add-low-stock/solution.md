`fun lowStock(threshold: Int = 5): List<Product> = products.values.filter { it.stock < threshold }.sortedBy { it.stock }`.
