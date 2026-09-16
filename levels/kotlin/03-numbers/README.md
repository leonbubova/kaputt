# numbers and arithmetic
Lesson: `+ - * /` work on numbers. One trap: dividing two Ints gives an Int — the remainder is dropped.
`7 / 2` is `3`, not 3.5. The dropped remainder is available with `%`: `7 % 2` is `1`.
That is exactly how money is handled in this game: prices are whole cents, so `1999` means 19.99.
    val price = 1999
    println(price / 100)      // 19
    println(price % 100)      // 99
Inside a string, a calculation needs braces: `"${price / 100} euro"` — a bare `$price / 100` would print the price, then " / 100".
Your task: the program has `val price = 1999`. Make it print exactly `19 euro 99 cent`, computed from `price` with `/` and `%`.
File: ~/.k8s-wargame/kotlin/app/src/Main.kt — open it in any editor (VS Code: `code ~/.k8s-wargame/kotlin/app`). Run it: `./run.sh` inside that folder (or `~/.k8s-wargame/kotlin/app/run.sh` from anywhere).
Check yourself:  wg check      stuck?  wg hint
