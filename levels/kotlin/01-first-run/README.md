# your first program
Lesson: a program is a text file with instructions. Kotlin is one language for writing them. The computer cannot
run the text directly — a compiler first translates it, then the result runs. You never have to think about
that here: `./run.sh` does both and shows the output.
Open `src/Main.kt`. It has one instruction inside `fun main() { … }` — `main` is where every program starts:
    println("hello, world")
`println` means "print this line". The text between the quotes is what it prints.
Try it — in a terminal:
    cd ~/.k8s-wargame/kotlin/app
    ./run.sh
Your task: change the text so the program prints exactly `hello, kotlin`. Save the file, run it again.
File: ~/.k8s-wargame/kotlin/app/src/Main.kt — open it in any editor (VS Code: `code ~/.k8s-wargame/kotlin/app`). Run it: `./run.sh` inside that folder (or `~/.k8s-wargame/kotlin/app/run.sh` from anywhere).
Check yourself:  wg check      stuck?  wg hint
