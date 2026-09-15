# ticket: model a product
"Orders need a proper `Product` type in `src/Models.kt`: `sku`, `name`, `priceCents` (Int, no floats for money) and `stock`. Two products with the same fields must be `==`, and we want `copy(stock = …)` for stock changes without touching the rest." Goal: `Product("A1", "cable", 1999, 12)` works, equals an identical one, and `copy` changes only what you name.
App: ~/.k8s-wargame/kotlin/app · `./run.sh` (compile + demo) · `wg check` compiles src/ with a hidden check
