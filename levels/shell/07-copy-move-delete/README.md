# copy, move, rename, delete — cp, mv, rm
Lesson: three commands that rearrange files. The first argument is always the thing you have, the second where it goes.
    cp FROM TO     copy. `cp a.txt b.txt` — now there are two. If TO is a folder, the copy goes inside it.
    mv FROM TO     move. If TO is a folder, the file goes inside. If TO is a new name, the file is renamed — same command.
    rm FILE        delete. There is no trash can and no undo. Read the name twice, then press Enter.
Try it:
    cd ~/.k8s-wargame/shell/sandbox
    ls
    cat draft.txt
Your task, in the sandbox: (1) rename `draft.txt` to `final.txt`, (2) put a copy of `final.txt` into the folder
`archive`, (3) delete `old-junk.txt`. `ls` and `ls archive` show whether it worked.
Check yourself:  wg check      stuck?  wg hint
