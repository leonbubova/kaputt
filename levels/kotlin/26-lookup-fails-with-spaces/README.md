# lookups fail when the sku comes from the scanner
"Skus from the barcode scanner arrive as `" a1 "` (spaces, lowercase). `normalize()` is supposed to handle that, but since a 'more idiomatic' rewrite `find(" a1 ")` is null." Goal: `find(" a1 ")` and `find("b2")` return the products; `normalize(" a1 ") == "A1"`.
App: ~/.k8s-wargame/kotlin/app · `./run.sh` (compile + demo) · `wg check` compiles src/ with a hidden check
