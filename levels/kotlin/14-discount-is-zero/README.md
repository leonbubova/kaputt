# the 25 % promo charges full price
"Every checkout with `percent = 25` bills the full price. `discount(1000, 25)` returns 1000. Someone 'clarified the precedence with parentheses' in `src/Money.kt`." Goal: `discount(1000, 25) == 750`, `discount(1000) == 900`.
App: ~/.k8s-wargame/kotlin/app · `./run.sh` (compile + demo) · `wg check` compiles src/ with a hidden check
