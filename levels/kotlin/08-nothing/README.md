# null: when there is no value
Lesson: sometimes there is no answer. Turning the text `"12"` into a number works; `"twelve"` has no number in it.
Kotlin says so in the type: `text.toIntOrNull()` returns `Int?` — an Int *or* `null` (nothing). The `?` is a
promise to the compiler that you will deal with the nothing case. The shortest way is `?:`, a fallback:
    val qty = "12".toIntOrNull() ?: 0        // 12
    val bad = "twelve".toIntOrNull() ?: 0    // 0
You will meet `?` all over Kotlin: it is how the language prevents the "NullPointerException" crashes of other languages.
Your task: write `fun parseQty(text: String): Int?` that returns the number in the text or `null`, and
`fun qtyOrZero(text: String): Int` that uses `parseQty` and returns 0 when there is no number.
File: ~/.k8s-wargame/kotlin/app/src/Main.kt — open it in any editor (VS Code: `code ~/.k8s-wargame/kotlin/app`). Run it: `./run.sh` inside that folder (or `~/.k8s-wargame/kotlin/app/run.sh` from anywhere).
Check yourself:  wg check      stuck?  wg hint
