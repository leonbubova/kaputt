# pipes — snap commands together with |
Lesson: two new commands and one connector:
    grep WORD FILE     print only the lines of FILE that contain WORD
    wc -l              count lines (word count; -l = lines only)
    A | B              the pipe: whatever A prints is fed into B, instead of onto the screen
Shell commands are small on purpose. The pipe chains them into something bigger:
    grep vegetarian guests.txt | wc -l        first keep the matching lines, then count them
Try it:
    cd ~/.k8s-wargame/shell/sandbox
    cat guests.txt
    grep vegetarian guests.txt
Your task: how many guests in `guests.txt` are vegetarian? Let the shell count, and put that number into `count.txt`
in the sandbox (the `>` from before works on the whole chain).
Check yourself:  wg check      stuck?  wg hint
