## 1
Concurrency in coroutines: `async { … }` starts a child and returns a `Deferred`; `.await()` gets its value. Children need a scope — inside a suspend function that is `coroutineScope { … }`, which also waits for all of them and cancels the rest if one fails.
## 2
The trap: `skus.map { async { fetchPrice(it) }.await() }` awaits each one *inside* the map, so they run one after another. Start them all first (`map { async { … } }`), then `awaitAll()` on the list of Deferreds.
## 3
```
import kotlinx.coroutines.*
suspend fun fetchAll(skus: List<String>): Map<String, Int> = coroutineScope {
    skus.map { sku -> async { sku to fetchPrice(sku) } }.awaitAll().toMap()
}
```
