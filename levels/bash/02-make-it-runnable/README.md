# run it like a program: shebang and chmod
Lesson: `bash hello.sh` works, but real scripts are started by name, like any program: `./hello.sh`. Two things make that possible.
1. The first line of the file tells the system which program should read it. For bash that line is:
    #!/usr/bin/env bash
   The `#!` pair is called the shebang. It must be line 1, nothing before it.
2. The file needs permission to be run. Files do not have it by default; `chmod +x FILE` (change mode, add execute) grants it.
The `./` in `./hello.sh` means "the one in this folder" — without it the shell looks for a program called hello.sh installed on the system and finds none.
Try it — with the hello.sh from lesson 1:
    cd ~/.k8s-wargame/bash/work
    ./hello.sh                 → permission denied
    chmod +x hello.sh
    ./hello.sh                 → hello from a script
Your task: make a new script `run-me.sh` in `~/.k8s-wargame/bash/work` whose first line is the shebang, whose second line prints `it runs`,
and give it execute permission — so that `./run-me.sh` prints `it runs`.
Work in `~/.k8s-wargame/bash/work` — `wg shell` drops you there. Make the file with any editor (`nano run-me.sh`, or VS Code: `code ~/.k8s-wargame/bash/work`).
Check yourself:  wg check      stuck?  wg hint
