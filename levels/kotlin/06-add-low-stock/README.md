# ticket: low-stock list for purchasing
"Purchasing wants `Inventory.lowStock(threshold)` in `src/Inventory.kt`: every product whose stock is below the threshold, emptiest first. Threshold defaults to 5." Goal: `lowStock()` on the seed data is `[C3, E5, B2]`, `lowStock(13)` is `[C3, E5, B2, A1]`.
App: ~/.k8s-wargame/kotlin/app · `./run.sh` (compile + demo) · `wg check` compiles src/ with a hidden check
