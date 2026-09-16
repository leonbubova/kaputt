## 1
Whoever runs the command owns the new file. If root creates it, it belongs to root. Switch to alice first, check with `whoami`, then create the file.
## 2
`su - alice` switches; then you stand in `/home/alice`, so `echo hi > note.txt` lands in the right place. `exit` returns to root.
## 3
    su - alice
    echo hi > /home/alice/note.txt
    exit
