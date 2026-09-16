## 1
`ls -l` shows owner then group. Both are changed with `chown`; a colon between them sets both at once.
## 2
`chown alice:dev /srv/notes/todo.txt`, then `ls -l /srv/notes` must show `alice dev`.
## 3
    chown alice:dev /srv/notes/todo.txt
