# remembering things: val
Lesson: a program remembers things in named boxes. `val name = "Ada"` makes a box called `name` holding the
text Ada. From then on `name` means that text. Text in quotes is a *string*; a plain number like `36` is an *Int*.
To put a box's content inside a printed string, write `$` and its name: `println("hello, $name")` prints `hello, Ada`.
Try it — these two lines are already inside `main`; run and read the output:
    val name = "Ada"
    println("hello, $name")
Your task: add a second box `age` holding the number 36 and make the program print exactly `Ada is 36`.
Keep the boxes — the printed line must use `$name` and `$age`, not typed-out text.
File: ~/.k8s-wargame/kotlin/app/src/Main.kt — open it in any editor (VS Code: `code ~/.k8s-wargame/kotlin/app`). Run it: `./run.sh` inside that folder (or `~/.k8s-wargame/kotlin/app/run.sh` from anywhere).
Check yourself:  wg check      stuck?  wg hint
