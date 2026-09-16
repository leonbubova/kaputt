# ticket: look up a product, or nothing
"`Inventory` in `src/Inventory.kt` has no way to look up a sku. Add `find(sku: String): Product?` — the product, or `null` when the sku is not known. Keys go through the existing `normalize()` so `" a1 "` finds `A1`." Goal: `find("A1")?.name == "cable"`, `find("nope") == null`, `find(" a1 ")` is not null.
App: ~/.k8s-wargame/kotlin/app · `./run.sh` (compile + demo) · `wg check` compiles src/ with a hidden check
