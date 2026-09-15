## 1
`async { }` starts work concurrently, but `.await()` suspends until *that* one is done. If the await happens inside the `map` lambda, the next `async` is not started until the previous finished — sequential, 5 × 200 ms. Time it in `./run.sh` (the prices line prints the ms).
## 2
Separate the two phases: `map { async { … } }` returns a `List<Deferred>`; only then `awaitAll()` on the list.
## 3
```
// src/Prices.kt → fetchAll
skus.map { sku -> async { runCatching { sku to fetchPrice(sku) }.getOrNull() } }.awaitAll().filterNotNull().toMap()
```
