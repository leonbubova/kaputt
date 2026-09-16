# nightly price sync is 5x slower than before
"`fetchAll` for 5 skus takes a full second again; it used to be ~200 ms. Nothing in the feed changed. Someone 'simplified' the coroutine code in `src/Prices.kt`." Goal: `fetchAll` of 5 skus returns all prices in well under 600 ms.
App: ~/.k8s-wargame/kotlin/app · `./run.sh` (compile + demo) · `wg check` compiles src/ with a hidden check
