# a function: name a piece of work
Lesson: a function is a named piece of work you can run as often as you like. `main` is one. Your own looks like this:
    fun greet(name: String): String {
        return "hello, $name"
    }
`greet` is the name. `name: String` is the input it needs (a *parameter*). `: String` after the brackets is the
type of what it gives back, and `return` hands that back. Calling it: `greet("Ada")` — the result is a string
you can print: `println(greet("Ada"))`.
Your task: write `fun greet(name: String): String` next to `main` (outside its braces) that returns `hello, NAME`,
and make `main` print `greet("Ada")` and `greet("Linus")` — two lines.
File: ~/.k8s-wargame/kotlin/app/src/Main.kt — open it in any editor (VS Code: `code ~/.k8s-wargame/kotlin/app`). Run it: `./run.sh` inside that folder (or `~/.k8s-wargame/kotlin/app/run.sh` from anywhere).
Check yourself:  wg check      stuck?  wg hint
