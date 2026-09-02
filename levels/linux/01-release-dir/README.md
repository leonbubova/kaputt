# the filesystem is a tree: mkdir -p builds a path, > writes a file
Lesson: on Linux everything lives in one tree that starts at `/`. A path like `/srv/app/releases/1.4.2` is just the walk from the root down through directories. Every directory on that walk has to exist before you can put something inside it.
`mkdir` makes one directory and refuses if the parent is missing. `mkdir -p` makes the whole path in one go, parents included, and is quiet if parts already exist — that makes it safe to run twice.
A file is created the moment something writes to it. `echo text > FILE` prints `text` and the `>` sends it into FILE instead of the screen, creating or overwriting it. That is the fastest way to make a small file with known content.
    mkdir -p /a/b/c              create the whole path, parents included
    echo 1.2.3 > /a/b/VERSION    write one line into a (new) file
    ls -R /a                     list a tree recursively
    cat /a/b/VERSION             show what is in the file
Try it first: `mkdir -p /tmp/x/y/z && ls -R /tmp/x` — three directories from one command.
Your task: "Release 1.4.2 ships tonight. Create `/srv/app/releases/1.4.2/` with a file `VERSION` containing exactly `1.4.2`, and an empty subdirectory `conf/` next to it." (`wg shell` puts you on the box as root.)
Goal: `/srv/app/releases/1.4.2/VERSION` holds `1.4.2`; `/srv/app/releases/1.4.2/conf/` exists and is a directory.
Check yourself:  wg check      stuck?  wg hint
