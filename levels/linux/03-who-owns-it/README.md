# every file has an owner — ls -l and chown
Lesson: `ls -l` (long listing) shows one line per file, and the middle of that line says who owns it:
    -rw-r--r-- 1 root root 9 Sep 16 10:00 todo.txt
                 ^^^^ ^^^^
                 owner group
Owner is a user (lesson 2). Group is a named set of users — `dev`, `ops` — so several people can share a file.
Only root may hand a file to someone else:
    chown USER FILE            new owner
    chown USER:GROUP FILE      new owner and new group in one go
Try it:
    wg shell
    ls -l /srv/notes
    cat /srv/notes/todo.txt
    chown bob /srv/notes/todo.txt
    ls -l /srv/notes                the owner column changed
Your task: `/srv/notes/todo.txt` must be owned by user `alice` and group `dev`. Leave its text as it is.
Where: on the box (`wg shell`).
Check yourself:  wg check      stuck?  wg hint
