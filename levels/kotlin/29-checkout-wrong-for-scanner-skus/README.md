# checkout: null for scanned skus and no discount for the rest
"Two complaints in one ticket: (1) `checkout` returns `null` for skus that come from the scanner (`" a1 "`) although the product exists; (2) for everyone else the promo code (`percent = 25`) changes nothing. Both started with last week's 'small cleanups'." Goal: `checkout(inv, Order(" a1 ", 3, …), percent = 25) == 4498` and `checkout(inv, Order("A1", 1, …)) == 1999`.
App: ~/.k8s-wargame/kotlin/app · `./run.sh` (compile + demo) · `wg check` compiles src/ with a hidden check
