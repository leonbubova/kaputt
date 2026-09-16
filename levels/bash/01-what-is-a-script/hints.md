## 1
A script is a plain text file. Whatever commands are inside, `bash FILE` runs them one after the other. Yours needs one line: an `echo` that prints the four words.
## 2
Create the file in `~/.k8s-wargame/bash/work` — with an editor, or with the `>` you know from the shell track: `echo 'echo TEXT' > hello.sh` (the single quotes keep the inner echo as text so it lands in the file).
## 3
    cd ~/.k8s-wargame/bash/work
    echo 'echo hello from a script' > hello.sh
    bash hello.sh
