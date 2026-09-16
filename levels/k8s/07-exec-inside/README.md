# go inside a pod: exec
Lesson: sometimes looking from outside (describe, logs) is not enough and you want a terminal *inside* the
pod's container — to look at its files or try a command where the program runs.
    kubectl exec -it NAME -- sh    open a shell inside pod NAME. -it = interactive terminal; everything after -- runs inside the pod
The prompt changes to `/ #` — you are now inside. It is a tiny separate machine: its own files, its own
`hostname`. `exit` brings you back to your own terminal.
Try it — a pod `box` is running:
    kubectl exec -it box -- sh
    hostname
    ls /
    exit
Your task: inside the pod `box`, create the file `/tmp/hello.txt` containing the word `hi`
(`echo hi > /tmp/hello.txt` — same as in the shell track, just typed at the `/ #` prompt). Then `exit`.
Where: your normal terminal. `wg start` already pointed `kubectl` at the wargame cluster, and namespace `wg` is your default — no extra flags needed.
Check yourself:  wg check      stuck?  wg hint
