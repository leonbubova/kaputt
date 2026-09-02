## 1
"Permission denied" is about the file's permissions, not about you. Lesson 13 showed how to see them: `ls -l backup.sh`.
## 2
There is no x in `-rw-r--r--`: the script is not allowed to execute. `chmod +x FILE` fixes that; then run it again.
## 3
    cd ~/.k8s-wargame/shell/sandbox
    chmod +x backup.sh
    ./backup.sh
