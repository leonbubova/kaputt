## 1
Three outcomes need three branches. Order matters: check `== 0` first, then `< 5`, then everything else.
## 2
`else if (stock < 5) { return "low" }` goes between the first `if` block and the final `else`.
## 3
```
fun stockLabel(stock: Int): String {
    if (stock == 0) {
        return "sold out"
    } else if (stock < 5) {
        return "low"
    } else {
        return "ok"
    }
}
```
