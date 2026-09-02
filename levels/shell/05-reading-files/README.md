# reading files — cat and less
Lesson: two ways to look inside a file:
    cat FILE     print the whole file on the screen. Perfect for short files.
    less FILE    show one screen at a time. Space or ↓ moves on, ↑ goes back, q quits. For long files.
Remember q. Everyone gets stuck inside less exactly once — now you won't.
Try it:
    cd ~/.k8s-wargame/shell/sandbox
    cat letter.txt
    less long.txt        (look around, then press q)
Your task: `letter.txt` in the sandbox contains a secret word. Read it, then write that word — just the word —
into a new file `answer.txt` in the sandbox.
Check yourself:  wg check      stuck?  wg hint
