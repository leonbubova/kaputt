## 1
Run the script, then on the very next line print `$?`. That number is its exit code — nothing else counts, not the text it printed.
## 2
    ./mystery.sh
    echo $?
Take the number you see and put it into answer.txt with `echo NUMBER > answer.txt`.
## 3
    cd ~/.k8s-wargame/bash/work
    ./mystery.sh; echo $?
    echo 4 > answer.txt
