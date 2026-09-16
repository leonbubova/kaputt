# ticket: read one price from the supplier feed
"Price sync: add `suspend fun fetchPrice(sku: String): Int` to `src/Prices.kt`. The (simulated) feed is `PRICE_FEED`; every call must wait `delay(200)` first, like the real HTTP call would. An unknown sku throws `IllegalArgumentException`." Goal: `fetchPrice("A1")` is `2099` after ~200 ms; `fetchPrice("ZZ")` throws.
App: ~/.k8s-wargame/kotlin/app · `./run.sh` (compile + demo) · `wg check` compiles src/ with a hidden check
