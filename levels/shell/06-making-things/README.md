# making things — mkdir and touch
Lesson: two commands create things out of nothing:
    mkdir NAME     make a new, empty folder
    touch NAME     make a new, empty file (on an existing file it only updates the "last changed" time)
And you already know  echo TEXT > NAME  — a file with text in it. Both print nothing when they work; `ls` shows the result.
Avoid spaces in names — the space would split the name into two arguments. Use `-` or `_`: `my-notes.txt`.
(To write more than one line, most machines have an editor: `nano FILE`. Type, Ctrl+O then Enter saves, Ctrl+X leaves.)
Try it:
    cd ~/.k8s-wargame/shell/sandbox
    mkdir test
    touch test/empty.txt
    ls test
Your task: in the sandbox, make a folder `project` and inside it an empty file `notes.txt`. Then `ls project` to admire it.
Check yourself:  wg check      stuck?  wg hint
