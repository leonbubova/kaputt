# a script is commands in a file, and $1 is its first argument
Lesson: a bash script is nothing more than a text file with commands in it, run top to bottom. Anything you can type at the prompt can live in a script — the point is to run it again without retyping.
Two things make a file a script: a first line `#!/usr/bin/env bash` that says which program runs it, and the executable bit (`chmod +x`) so you can call it by name.
Whatever you type after the script's name arrives inside it as positional arguments: `$1` is the first, `$2` the second. `"$1"` with quotes is the safe way to use one.
    printf 'hello, %s\n' "$1"      print with a placeholder — %s takes the argument
    chmod +x greet.sh              make the file runnable
    ./greet.sh Ada                 run it with one argument
Try it first: `printf 'hi %s\n' there` on the prompt — same thing, no script yet.
Your task: the onboarding docs reference a greeter script that no longer exists. Create `~/.k8s-wargame/bash/work/greet.sh` so that `greet.sh Ada` prints exactly `hello, Ada`.
Check yourself:  wg check      stuck?  wg hint
