# scripts glue tools together: $( ) captures a command's output
Lesson: a shell script rarely does the work itself — it hands the job to a tool that already exists and shapes the result. Counting lines is `wc -l`'s job; the script's job is to point it at the right file and print a clean number.
`$( … )` is command substitution: it runs the command inside and replaces itself with the output. That is how you get a tool's answer into a variable or an `echo`.
Two details bite here. `wc -l FILE` prints the filename after the number; `wc -l < FILE` reads from a redirect and prints only the number. And `wc` pads the number with spaces — passing it through `$( )` unquoted strips them.
    wc -l < "$1"                    count lines of the file named by $1
    n=$(wc -l < "$1")               capture the output into n
    echo $n                         unquoted here on purpose: drops wc's padding
Try it first: `wc -l < /etc/hosts` versus `wc -l /etc/hosts`.
Your task: ops drops a data file in the sandbox and wants a quick line counter. Write `count-lines.sh FILE`: print the number of lines in FILE, nothing else.
Goal: a file `data.txt` (5 lines) is present; `count-lines.sh data.txt` prints `5`.
Check yourself:  wg check      stuck?  wg hint
