# ticket: format cents as euro
"Reports print raw cents. Add an extension function `Int.toEuro()` in a new `src/Money.kt` so that `1999.toEuro()` is `€19.99` and `5.toEuro()` is `€0.05` — always two decimals, no float maths." Goal: `1999.toEuro() == "€19.99"`.
App: ~/.k8s-wargame/kotlin/app · `./run.sh` (compile + demo) · `wg check` compiles src/ with a hidden check
