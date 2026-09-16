# lists and loops
Lesson: a list holds several values in order: `val prices = listOf(1999, 499, 250)`. `prices.size` is how many,
`prices[0]` the first. To do something with each one, loop:
    for (p in prices) {
        println(p)
    }
`p` takes each value in turn. To add them up you need a box that can change — `var` instead of `val`:
    var sum = 0
    for (p in prices) { sum = sum + p }      // or: sum += p
Your task: write `fun total(prices: List<Int>): Int` that returns the sum of all prices (0 for an empty list),
and make `main` print `total(prices)`.
File: ~/.k8s-wargame/kotlin/app/src/Main.kt — open it in any editor (VS Code: `code ~/.k8s-wargame/kotlin/app`). Run it: `./run.sh` inside that folder (or `~/.k8s-wargame/kotlin/app/run.sh` from anywhere).
Check yourself:  wg check      stuck?  wg hint
