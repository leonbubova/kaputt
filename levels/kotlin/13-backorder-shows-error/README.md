# backordered items come out as "error"
"When a customer orders the monitor (stock 0) the confirmation mail says `error` instead of the backorder note with the ETA. The code has a branch for every case, apparently." Goal: `describe(OrderResult.Backordered("C3", "2 weeks"))` mentions `backordered` and the eta — and make the compiler catch a forgotten case next time.
App: ~/.k8s-wargame/kotlin/app · `./run.sh` (compile + demo) · `wg check` compiles src/ with a hidden check
