## 1
Commands are small on purpose; the pipe `|` snaps them together — whatever the left one prints is fed into the right one instead of onto the screen. Here `grep vegetarian guests.txt` shows the vegetarian lines and `wc -l` counts lines it is given.
## 2
`grep vegetarian guests.txt | wc -l` prints the number. Put `> count.txt` at the very end to save it.
## 3
    cd ~/.k8s-wargame/shell/sandbox
    grep vegetarian guests.txt | wc -l > count.txt
