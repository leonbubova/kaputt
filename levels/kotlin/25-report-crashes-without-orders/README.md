# NoSuchElementException on a quiet day
"The daily mail fails on days without a single order: `NoSuchElementException: List is empty` in `topSeller`. It should just say there is no top seller (null)." Goal: `topSeller(emptyList()) == null`, and with orders it still returns the sku with the most units.
App: ~/.k8s-wargame/kotlin/app · `./run.sh` (compile + demo) · `wg check` compiles src/ with a hidden check
