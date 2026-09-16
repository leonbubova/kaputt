# for: the same thing for each
Lesson: a loop repeats lines for every item in a list. `for` names a variable, `in` lists the items, the lines between
`do` and `done` run once per item — with the variable holding the current one:
    for fruit in apple pear plum; do
      echo "I like $fruit"
    done
That prints three lines: `I like apple`, `I like pear`, `I like plum`. The variable name is yours to pick; the list
is just words separated by spaces, and it can be as long as you like.
Try it — type in the terminal:
    for n in 1 2 3; do echo "round $n"; done
    for color in red green blue; do echo "$color"; done
Your task: make a script `fruits.sh` in `~/.k8s-wargame/bash/work` (shebang, chmod +x) that uses a `for` loop over the
three words apple pear plum and prints each on its own line — the output is exactly:
    apple
    pear
    plum
Only one `echo` in the file — the loop does the repeating.
Work in `~/.k8s-wargame/bash/work` — `wg shell` drops you there. Make the file with any editor (`nano fruits.sh`, or VS Code: `code ~/.k8s-wargame/bash/work`).
Check yourself:  wg check      stuck?  wg hint
