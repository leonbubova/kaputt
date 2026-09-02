# permissions and chmod — running your first script
Lesson: a script is a text file with commands in it, one per line — the shell runs them top to bottom.
To run a script that lies in your current folder you type  ./NAME  (the `./` says "the one right here", not
something from PATH).
Every file carries permissions: who may read (r), write (w) and execute (x) it. `ls -l` shows them at the left,
like `-rw-r--r--`. A freshly made file is never executable — the shell refuses to run it. You grant that with:
    chmod +x NAME          change mode: add execute
One more thing: every command ends with an exit code — 0 means "went fine", anything else means trouble.
`echo $?` shows the code of the command you just ran. Scripts and tools rely on it to decide what happens next.
Try it:
    cd ~/.k8s-wargame/shell/sandbox
    cat hello.sh
    ls -l hello.sh
    ./hello.sh           (watch it refuse)
    echo $?
Your task: make `hello.sh` executable and run it with `./hello.sh`. It writes a small file to prove that it ran.
Check yourself:  wg check      stuck?  wg hint
