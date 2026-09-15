# price sync: slow, and dead as soon as one sku is retired
"The nightly sync takes a second per five skus *and* aborts completely when the feed rejects a single sku — we get no prices at all. Both need fixing tonight; `fetchPrice` itself must keep throwing for unknown skus." Goal: `fetchAll` of 5 valid skus takes well under 600 ms, and with a bad sku in the list the valid prices still come back.
App: ~/.k8s-wargame/kotlin/app · `./run.sh` (compile + demo) · `wg check` compiles src/ with a hidden check
