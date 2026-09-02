# wildcards — * means "anything"
Lesson: a `*` in a name stands for "any characters". Before the command runs, the shell swaps the pattern for every
name that matches — so the command sees a plain list of files:
    ls *.jpg             becomes   ls beach.jpg cat.jpg mountain.jpg
    mv *.jpg photos/     moves all three at once
    rm *                 deletes everything in the folder. (Now you see why rm deserves respect.)
`*.txt` = anything ending in .txt.   `report*` = anything starting with report.   `*` alone = everything here.
Try it:
    cd ~/.k8s-wargame/shell/sandbox
    ls
    ls *.jpg
    ls *.txt
Your task: move every `.jpg` file in the sandbox into the folder `photos` — with one command. The `.txt` files stay.
Check yourself:  wg check      stuck?  wg hint
