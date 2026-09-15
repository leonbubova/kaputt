# customers appear twice in the daily mail
"The customer list in the report shows Ada three times even though `customers()` calls `.distinct()`. Started after `Customer` was 'simplified' in `src/Models.kt`." Goal: `customers()` lists each e-mail once; two `Customer`s with the same fields are `==`.
App: ~/.k8s-wargame/kotlin/app · `./run.sh` (compile + demo) · `wg check` compiles src/ with a hidden check
