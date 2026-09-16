# UninitializedPropertyAccessException on the first order
"Every order dies with `lateinit property log has not been initialized` in `Inventory.order`. The audit log used to be set up when the inventory was created; that code was 'moved' in a refactor and never landed." Goal: `order()` and `restock()` work and `log` records them. Keep `log` a `MutableList<String>`.
App: ~/.k8s-wargame/kotlin/app · `./run.sh` (compile + demo) · `wg check` compiles src/ with a hidden check
