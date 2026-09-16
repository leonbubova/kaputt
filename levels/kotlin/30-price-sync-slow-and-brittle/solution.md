`.await()` inside the `map` makes the fetches sequential, and an uncaught exception in one `async` cancels the whole scope.
    src/Prices.kt → map { async { runCatching { … }.getOrNull() } }.awaitAll().filterNotNull()
