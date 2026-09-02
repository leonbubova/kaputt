# "backup.sh doesn't work — it says Permission denied"
Your first ticket. A colleague writes: "I put `backup.sh` into the sandbox. It should copy all the notes from
`notes/` into `backup/`. When I run `./backup.sh` I get `permission denied` and nothing is copied. Can you make it run?"
Lesson: this is how the rest of the wargame works — you get a symptom, you find the cause, you fix it. The
shell's error messages are short but literal; read the exact words, they name the category of the problem:
    No such file or directory    the path or name is wrong — look with ls and pwd
    command not found            not in PATH, or a typo — lesson 11
    Permission denied            you are not allowed to do that to this file — look at its permissions, lesson 13
Try it:
    cd ~/.k8s-wargame/shell/sandbox
    ./backup.sh          reproduce the problem — read the message word by word
    cat backup.sh        the script is fine; do not rewrite it
Your task: make `./backup.sh` run successfully so that `backup/` contains the copies of the three notes.
Check yourself:  wg check      stuck?  wg hint
Done? That was track zero. Next stop:  wg track linux  (a real machine to fix)  or  wg track bash  (write your own scripts).
