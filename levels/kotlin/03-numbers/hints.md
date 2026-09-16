## 1
`price / 100` gives the euros (the remainder is dropped), `price % 100` gives what was dropped: the cents.
## 2
Put each calculation in braces inside the string: `"${price / 100} euro ${price % 100} cent"`.
## 3
```
val price = 1999
println("${price / 100} euro ${price % 100} cent")
```
