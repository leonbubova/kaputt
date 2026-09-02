# variables, export, PATH — and "command not found"
Lesson: the shell remembers named values, called variables. `$NAME` means "the value of NAME":
    echo $HOME              your home folder
    echo $PATH              a list of folders, separated by :
    COLOR=blue              set your own (no spaces around the =)
    echo $COLOR             → blue
    export COLOR            also hand it to every program you start from now on — it becomes an environment variable
    env                     print all environment variables, one NAME=value per line
PATH is how the shell finds commands: for `ls` it looks in each folder of PATH, in order, for a file called ls.
"command not found" means: no such file in any of those folders — a typo, or a program that is not installed
(or installed somewhere PATH does not list).
Try it:
    echo $HOME
    echo $PATH
    lss             ← the error you will see most often in your life
Your task: set a variable `FAVORITE_COLOR` to `blue`, export it, then save the whole environment into a file:
    env > ~/.k8s-wargame/shell/sandbox/env.txt
Check yourself:  wg check      stuck?  wg hint
