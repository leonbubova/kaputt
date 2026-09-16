## 1
The function gets the list as a parameter: `fun total(prices: List<Int>): Int { … }`. Inside: `var sum = 0`, a `for` loop that adds each price, then `return sum`.
## 2
`val` cannot change after it is set, `var` can. `sum += p` is short for `sum = sum + p`.
## 3
```
fun total(prices: List<Int>): Int {
    var sum = 0
    for (p in prices) {
        sum += p
    }
    return sum
}
```
