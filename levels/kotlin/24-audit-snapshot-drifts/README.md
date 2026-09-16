# the audit snapshot changes after it was taken
"Compliance takes `snapshot()` at midnight and compares it with the live stock in the morning — and both are always identical, even after orders. The snapshot is supposed to be frozen at the moment it was taken." Goal: a snapshot taken before an order still shows the old stock afterwards.
App: ~/.k8s-wargame/kotlin/app · `./run.sh` (compile + demo) · `wg check` compiles src/ with a hidden check
