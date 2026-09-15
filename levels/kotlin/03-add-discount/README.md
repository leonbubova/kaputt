# ticket: percentage discount with a default
"Sales wants `discount(priceCents, percent)` in `src/Money.kt`: price after a percentage discount, in cents. When the percentage is left out it is 10 %. Callers should be able to write `discount(1000, percent = 25)`." Goal: `discount(1000, 25) == 750`, `discount(1000) == 900`.
App: ~/.k8s-wargame/kotlin/app · `./run.sh` (compile + demo) · `wg check` compiles src/ with a hidden check
