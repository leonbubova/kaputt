`coroutineScope { skus.map { sku -> async { sku to fetchPrice(sku) } }.awaitAll().toMap() }` — start every async first, await afterwards.
