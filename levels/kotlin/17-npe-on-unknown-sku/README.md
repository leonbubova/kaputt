# NullPointerException on the describe endpoint
"Support types a sku that doesn't exist and the whole demo dies with `java.lang.NullPointerException` in `Inventory.describe`. It used to say `unknown sku …`." Goal: `describe("nope")` returns a text containing `unknown`, `describe("A1")` still reports name and stock. `find()` must keep returning `Product?`.
App: ~/.k8s-wargame/kotlin/app · `./run.sh` (compile + demo) · `wg check` compiles src/ with a hidden check
