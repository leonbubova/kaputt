# "$@" is all the arguments, and for loops over them
Lesson: a script does not know in advance how many arguments it will get. `"$@"` expands to all of them, one word each, however many there are — with the quotes, an argument containing a space stays one word. (`$#` is how many there are.)
A `for` loop visits a list one item at a time: `for n in "$@"; do …; done`. Inside the loop `$n` is the current item.
To add things up you need a variable that carries a running total across the rounds: start it at 0, then `total=$((total + n))` each time. Variables are plain text until `$(( ))` treats them as numbers.
    "$@"                            every argument, intact
    for n in "$@"; do …; done       one round per argument
    total=$((total + n))            arithmetic assignment
    echo "$total"                   print the result
Try it first: `for w in a b c; do echo "item: $w"; done`.
Your task: a billing helper needs to total however many amounts it is given. Write `sum.sh`: it prints the sum of all its integer arguments, and prints `0` when given none.
Goal: `sum.sh 2 3 4` prints `9`; `sum.sh` prints `0`.
Check yourself:  wg check      stuck?  wg hint
