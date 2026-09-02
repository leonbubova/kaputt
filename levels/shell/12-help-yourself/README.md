# help yourself — --help, man, Tab, ↑
Lesson: nobody memorises the shell. You look things up, right there in the terminal:
    COMMAND --help    a short usage summary. (On macOS a few commands only know -h, or none; then use man.)
    man COMMAND       the manual — long and exact. /word searches, n jumps to the next hit, q quits.
    Tab               finishes names for you: type `cd ki` + Tab → `cd kitchen/`. Tab twice lists all possibilities.
    ↑ / ↓             walk through the commands you typed before.  `history` lists them all.
Options are arguments that start with `-` and change how a command behaves: `ls -l` gives a long listing with
sizes, dates and permissions. The manual tells you which options a command has.
Try it:
    cd ~/.k8s-wargame/shell/sandbox
    ls
    ls -l
    man ls            (find the option about "hidden" or "dot" files, then q)
Your task: the sandbox contains a hidden file that plain `ls` does not show — names starting with `.` are hidden.
Find the `ls` option that shows hidden files, then save such a listing of the sandbox into `listing.txt` in the sandbox.
Check yourself:  wg check      stuck?  wg hint
