# if and else: deciding
Lesson: programs choose with `if`. The part in round brackets is a yes/no question; the block after it runs
only when the answer is yes; `else` runs otherwise. Questions compare: `==` equal, `<` less than, `>` greater than.
    fun stockLabel(stock: Int): String {
        if (stock == 0) {
            return "sold out"
        } else {
            return "ok"
        }
    }
Several questions chain: `if (…) { } else if (…) { } else { }` — the first yes wins.
Your task: `stockLabel` is in `src/Main.kt`. Extend it: 0 → `sold out`, anything below 5 → `low`, everything else → `ok`.
File: ~/.k8s-wargame/kotlin/app/src/Main.kt — open it in any editor (VS Code: `code ~/.k8s-wargame/kotlin/app`). Run it: `./run.sh` inside that folder (or `~/.k8s-wargame/kotlin/app/run.sh` from anywhere).
Check yourself:  wg check      stuck?  wg hint
