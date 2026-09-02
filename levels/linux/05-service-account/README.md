# users and groups: who a process runs as, and who owns a file
Lesson: every process runs as a user, and every user belongs to one primary group plus any number of extra groups. Files carry an owner and a group. Access is decided by matching those two against each other — which is why services get their own account instead of running as root.
`groupadd` creates a group, `useradd` creates a user. `useradd` does nothing extra unless asked: `-m` creates the home directory, `-s SHELL` sets the login shell, `-g GROUP` sets the primary group. Without `-m` the user exists but cannot log in properly.
`chown USER:GROUP PATH` hands a file or directory to that user and group. `id` shows what the system believes about a user.
    groupadd svc                          create a group
    useradd -m -g svc -s /bin/bash NAME   user with home, primary group, shell
    id NAME                               uid, gid and groups of a user
    getent passwd NAME                    home and shell of a user
    chown NAME:svc /path                  set owner and group
Try it first: `id` and `id root` — your own account versus root.
Your task: "Create a group `svc` and a user `runner` whose primary group is `svc`, with a home directory and bash as shell. `/srv/data` must be owned by `runner`, group `svc`."
Goal: `id runner` shows primary group `svc`; `/srv/data` is `runner:svc`; runner can log in with `su - runner`.
Check yourself:  wg check      stuck?  wg hint
