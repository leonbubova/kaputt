# if: do something only when
Lesson: a script can decide. `if` runs a block of lines only when a test is true, `else` gives the other case, `fi`
(if backwards) closes it. The most common test compares two texts with `[ "$a" = "$b" ]` — note the spaces: after `[`,
around `=`, before `]`; they are required.
    if [ "$1" = "open" ]; then
      echo "come in"
    else
      echo "go away"
    fi
Read it aloud: if the first argument equals open, then print come in, else print go away, end-if. The quotes around `$1`
keep the test working even when no argument was given (an empty value would otherwise vanish and break the line).
Try it — type in the terminal, one line at a time, then read the result:
    word=open
    if [ "$word" = "open" ]; then echo yes; else echo no; fi
    word=shut
    if [ "$word" = "open" ]; then echo yes; else echo no; fi
Your task: make a script `door.sh` in `~/.k8s-wargame/bash/work` (shebang, chmod +x): `./door.sh open` prints `come in`;
any other first argument — or none at all — prints `go away`.
Work in `~/.k8s-wargame/bash/work` — `wg shell` drops you there. Make the file with any editor (`nano door.sh`, or VS Code: `code ~/.k8s-wargame/bash/work`).
Check yourself:  wg check      stuck?  wg hint
