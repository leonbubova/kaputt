# arguments: $1 and $2
Lesson: from the shell track you know that a command takes arguments: `echo red blue` has two. Your own script gets
them the same way — and inside the script they are ready-made variables: `$1` is the first argument, `$2` the second,
`$3` the third … They work like the variables of lesson 3, so you use them inside double quotes:
    echo "first: $1"
    echo "second: $2"
An argument you did not pass is simply empty. Which argument is which is decided by order alone, so count them.
Try it — put those two lines into a file and run it with different words:
    cd ~/.k8s-wargame/bash/work
    printf 'echo "first: $1"\necho "second: $2"\n' > try.sh
    bash try.sh red blue
    bash try.sh one
Your task: make a script `two.sh` in `~/.k8s-wargame/bash/work` (shebang, chmod +x) so that `./two.sh Ada Bob` prints two lines:
    first: Ada
    second: Bob
— and `./two.sh red blue` prints `first: red` and `second: blue`. The names come from the arguments, nothing is typed into the file.
Work in `~/.k8s-wargame/bash/work` — `wg shell` drops you there. Make the file with any editor (`nano two.sh`, or VS Code: `code ~/.k8s-wargame/bash/work`).
Check yourself:  wg check      stuck?  wg hint
