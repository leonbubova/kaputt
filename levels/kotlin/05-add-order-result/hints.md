## 1
A sealed class is an enum whose cases carry data: `sealed class OrderResult { data class Ok(val product: Product, val qty: Int) : OrderResult() … }`. The compiler knows every subtype, so a `when (r) { is Ok -> … }` over it needs no `else` — and shouts when a case is missing.
## 2
Inside `order`: `val p = find(sku) ?: return OrderResult.Unknown(sku)` handles the null case in one line. Then a `when { p.stock == 0 -> … ; qty > p.stock -> … ; else -> … }` for the rest. Stock is reduced by writing back a copy: `products[p.sku] = p.copy(stock = p.stock - qty)`.
## 3
```
sealed class OrderResult {
    data class Ok(val product: Product, val qty: Int) : OrderResult()
    data class Insufficient(val sku: String, val available: Int) : OrderResult()
    data class Backordered(val sku: String, val eta: String) : OrderResult()
    data class Unknown(val sku: String) : OrderResult()
}
fun order(sku: String, qty: Int): OrderResult {
    val p = find(sku) ?: return OrderResult.Unknown(sku)
    return when {
        p.stock == 0 -> OrderResult.Backordered(p.sku, "2 weeks")
        qty > p.stock -> OrderResult.Insufficient(p.sku, p.stock)
        else -> { products[p.sku] = p.copy(stock = p.stock - qty); log.add("order ${p.sku} x$qty"); OrderResult.Ok(p, qty) }
    }
}
```
