# redirection — > and >>
Lesson: normally a command prints to the screen. `>` redirects that output into a file — you have used it since
lesson 1. Now the detail that bites:
    command > FILE      REPLACES the file. Whatever was in it before is gone, silently.
    command >> FILE     APPENDS to the end. The old content stays, the new output goes below it.
Any command works: `ls > list.txt`, `date >> log.txt`, `echo done >> log.txt`.
Try it:
    cd ~/.k8s-wargame/shell/sandbox
    cat diary.txt
Your task: add the line  day three: learned redirection  to the END of `diary.txt`. Days one and two must still
be there afterwards. (Lost them? `wg reset` gives you a fresh diary.)
Check yourself:  wg check      stuck?  wg hint
