## 1
Two independent problems in one function: the timing (`./run.sh` prints the ms) and the exception. Fix the timing first — sequential vs concurrent is about *where* `.await()` sits.
## 2
Then the failure: inside a `coroutineScope` one failing child cancels the rest. Catch per item inside the `async`, drop the nulls.
## 3
```
// src/Prices.kt → fetchAll
coroutineScope { skus.map { sku -> async { runCatching { sku to fetchPrice(sku) }.getOrNull() } }.awaitAll().filterNotNull().toMap() }
```
