`async { … }.await()` inside the `map` lambda awaits each fetch before starting the next.
    src/Prices.kt → map { async { … } }.awaitAll()
