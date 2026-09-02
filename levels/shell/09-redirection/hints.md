## 1
`>` replaces the file, `>>` adds to its end. To keep the old lines you need the doubled arrow.
## 2
`echo TEXT >> diary.txt` appends one line. Check with `cat diary.txt` — it should show three days.
## 3
    cd ~/.k8s-wargame/shell/sandbox
    echo "day three: learned redirection" >> diary.txt
