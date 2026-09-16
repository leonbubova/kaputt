## 1
Structured concurrency: when one child of a `coroutineScope` throws, the scope cancels every sibling and rethrows — an all-or-nothing transaction. That is right for "abort everything", wrong for "skip the broken one". Where in `src/Prices.kt` could the exception be caught *per item*?
## 2
Handle it inside each `async`: `runCatching { sku to fetchPrice(sku) }.getOrNull()` gives `null` for the failed one, then `filterNotNull()` before `toMap()`. (`supervisorScope` would be the other tool: siblings survive, but you still have to await each result carefully.)
## 3
```
// src/Prices.kt → fetchAll
skus.map { sku -> async { runCatching { sku to fetchPrice(sku) }.getOrNull() } }.awaitAll().filterNotNull().toMap()
```
