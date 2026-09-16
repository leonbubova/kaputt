# exit codes: how a script says "it worked"
Lesson: every command and every script leaves a number behind when it finishes, its exit code. 0 means "worked",
anything else means "failed" — and which non-zero number is up to the program. The shell keeps the last exit code in
`$?` (dollar, question mark); print it right after the command, because the next command overwrites it:
    ls /nonexistent
    echo $?                → 2   (ls failed)
    echo hi
    echo $?                → 0   (worked)
A script ends with the exit code of its last line — unless it says `exit N`, which stops the script right there
with code N. `exit 0` = success, `exit 1` (or any other number) = failure. Other scripts and tools read this number
to know whether to carry on, which is why the incidents later care about it.
Try it — the sandbox contains a script `mystery.sh`:
    cd ~/.k8s-wargame/bash/work
    ./mystery.sh
    echo $?
Your task: find the exit code of `./mystery.sh` and write that number — only the number — into a file `answer.txt`
in `~/.k8s-wargame/bash/work` (for example with `echo NUMBER > answer.txt`).
Work in `~/.k8s-wargame/bash/work` — `wg shell` drops you there.
Check yourself:  wg check      stuck?  wg hint
