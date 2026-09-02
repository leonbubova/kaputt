## 1
`grep vegetarian guests.txt` shows the vegetarian lines. `wc -l` counts lines it is given. `|` hands one to the other.
## 2
`grep vegetarian guests.txt | wc -l` prints the number. Put `> count.txt` at the very end to save it.
## 3
    cd ~/.k8s-wargame/shell/sandbox
    grep vegetarian guests.txt | wc -l > count.txt
