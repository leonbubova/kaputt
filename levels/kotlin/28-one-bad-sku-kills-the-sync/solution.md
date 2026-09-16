One failing `async` cancels the whole `coroutineScope`; catching per item (`runCatching { … }.getOrNull()` + `filterNotNull()`) keeps the others.
    src/Prices.kt → fetchAll
