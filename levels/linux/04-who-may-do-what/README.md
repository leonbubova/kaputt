# who may do what — the mode and chmod
Lesson: the first column of `ls -l` is the mode: what the owner, the group and everybody else may do with the file.
    -rw-r--r--
     ^^^ ^^^ ^^^
     owner group others         r = read   w = write   x = execute (run)   - = not allowed
`chmod` (change mode) sets it. The shell track used `chmod +x`. Admins write the mode as three digits instead —
one per column, adding r=4, w=2, x=1:
    rw- = 6     r-- = 4     rwx = 7     --- = 0
    chmod 644 FILE      owner rw-, group r--, others r--    →  -rw-r--r--   (normal file)
    chmod 600 FILE      only the owner may read and write   →  -rw-------   (secrets)
Try it:
    wg shell
    ls -l /srv/notes
    chmod 600 /srv/notes/plan.txt
    ls -l /srv/notes                the mode column changed
Your task: `/srv/notes/plan.txt` currently lets everybody write into it (`-rw-rw-rw-`). Set it to `-rw-r--r--`:
owner reads and writes, everyone else only reads. Leave the text as it is.
Where: on the box (`wg shell`).
Check yourself:  wg check      stuck?  wg hint
