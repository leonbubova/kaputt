# ticket: fetch every price at once
"One sku at a time is too slow for the nightly sync. Add `suspend fun fetchAll(skus: List<String>): Map<String, Int>` to `src/Prices.kt` that fetches all prices concurrently — 5 skus must take about 200 ms, not a second." Goal: `fetchAll(listOf("A1","B2","C3","D4","E5"))` returns all 5 prices in well under 600 ms.
App: ~/.k8s-wargame/kotlin/app · `./run.sh` (compile + demo) · `wg check` compiles src/ with a hidden check
