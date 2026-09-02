# commands take arguments
Lesson: a command line is words separated by spaces. The first word is the command — what to do. The words
after it are its arguments — the details: what to do it to. `echo hello` is the command `echo` with one
argument. `echo red green blue` has three, and echo prints all of them with single spaces in between.
Each command decides what its arguments mean: for `echo` they are words to print; for others they are
file names, folders, or settings. Wrong arguments are the most common mistake in the shell — count them.
Try it:
    echo one
    echo one two three
Your task: write the three words  red green blue  into the file `~/.k8s-wargame/shell/sandbox/colors.txt`.
One echo, three arguments, plus the `>` from lesson 1.
Check yourself:  wg check      stuck?  wg hint
