# quote your variables: unquoted $1 splits on spaces
Lesson: before a command runs, the shell expands variables and then splits the result on spaces into separate words. `cat $1` with `$1` = `my notes.txt` becomes `cat my notes.txt` — two files, both missing. Double quotes stop the splitting: `cat "$1"` passes one argument, space included.
This is the single most common bash bug. Filenames with spaces, arguments with spaces, output of a command with newlines — all break the moment they pass through an unquoted `$var`. The habit to build: every `$var` gets quotes unless you can say why not.
    cat "$1"                        one argument, even with spaces
    cat $1                          split into words — wrong
    bash -x script.sh args          trace: shows exactly which words each command received
Try it first: `f="my notes.txt"; printf '[%s]\n' $f; printf '[%s]\n' "$f"` — count the brackets.
Your task: `catf.sh FILE` prints a file's contents. It works for `report.txt` but blows up on `my notes.txt`. The file exists; the script is wrong. Fix the script, don't rename the file.
Goal: `catf.sh 'my notes.txt'` prints the file's contents (`secret`).
Check yourself:  wg check      stuck?  wg hint
