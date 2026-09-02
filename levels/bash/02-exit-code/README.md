# every command answers with an exit code, and if/else branches on it
Lesson: besides its output, every command returns a number when it finishes: 0 means "went fine", anything else means "failed". Nobody sees it unless they ask — `echo $?` shows the code of the last command. Scripts, CI pipelines and `&&` chains all read this number to decide what happens next.
Your own script sets its code with `exit N`. Without an explicit exit, it returns the code of its last command.
`if` uses the same idea: it runs a test command and takes the `then` branch when that test returns 0. `[ ... ]` is the test command; `-eq` compares numbers; `$(( ))` does arithmetic.
    echo $?                          exit code of the last command
    exit 1                           end the script with code 1 (failure)
    $(( n % 2 ))                     remainder of n divided by 2
    if [ "$x" -eq 0 ]; then …; else …; fi
Try it first: `true; echo $?` then `false; echo $?`.
Your task: a pipeline step must fail on odd numbers. Write `even.sh N`: print `even` and exit 0 when N is even, print `odd` and exit 1 when it is odd.
Goal: `even.sh 4` prints `even` and exits 0; `even.sh 7` prints `odd` and exits 1.
Check yourself:  wg check      stuck?  wg hint
