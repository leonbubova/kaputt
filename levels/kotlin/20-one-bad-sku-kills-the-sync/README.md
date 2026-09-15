# one retired sku fails the whole price sync
"The catalogue contains a retired sku the feed no longer knows. Since then `fetchAll` throws `IllegalArgumentException: unknown sku ZZ` and *no* price gets updated — not even the valid ones. Expected: skip the unknown one, return the rest." Goal: `fetchAll(listOf("A1","ZZ","B2"))` returns A1 and B2 without throwing; `fetchPrice("ZZ")` itself must still throw.
App: ~/.k8s-wargame/kotlin/app · `./run.sh` (compile + demo) · `wg check` compiles src/ with a hidden check
