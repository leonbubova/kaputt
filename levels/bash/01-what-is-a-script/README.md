# a script is a file full of commands
Lesson: every command you type in the terminal (the shell track: `echo`, `ls`, `cd`) can also be written into a
text file, one command per line. Such a file is a script. Instead of typing the commands again and again, you
hand the file to `bash` and it runs them top to bottom, exactly as if you had typed them:
    bash FILE
That is the whole idea. A script file usually ends in `.sh` so people recognise it — bash itself does not care.
Try it — type these lines in the terminal:
    cd ~/.k8s-wargame/bash/work
    echo 'echo one' > try.sh
    echo 'echo two' >> try.sh
    bash try.sh
The file has two lines; bash runs both and prints `one` then `two`. (`>>` appends a line instead of replacing the file.)
Your task: make a file `hello.sh` in `~/.k8s-wargame/bash/work` with exactly one line in it:
    echo hello from a script
Then run it: `bash hello.sh` must print `hello from a script`.
Work in `~/.k8s-wargame/bash/work` — `wg shell` drops you there. Make the file with any editor (`nano hello.sh`, or VS Code: `code ~/.k8s-wargame/bash/work`).
Check yourself:  wg check      stuck?  wg hint
