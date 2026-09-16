## 1
The parameter is typed with the class name: `fun describe(p: Product): String`. Inside, `p.name` and `p.stock` are its parts.
## 2
Build the string with braces around each part: `"${p.name}: ${p.stock} in stock"`.
## 3
```
fun describe(p: Product): String {
    return "${p.name}: ${p.stock} in stock"
}
```
