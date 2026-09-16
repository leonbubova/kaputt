# users — who you are on the box, and who root is
Lesson: a Linux machine has several users. Every file, every running program belongs to one of them. One user
is special: `root`, the administrator — root may do anything. Everyone else may only touch their own things.
On the box you are root. On a real server you log in as a normal user and put `sudo` in front of a single
command to run just that one as root — you will meet that later. Three commands:
    whoami           which user am I right now?
    id NAME          does user NAME exist, and which groups is NAME in?  (groups come in a later lesson)
    su - NAME        switch user: become NAME, in NAME's home folder. `exit` brings you back to root.
Try it:
    wg shell
    whoami
    ls /home                the normal users' home folders: alice, app, bob, deploy
    id alice
    su - alice
    whoami                  you are alice now — the prompt says so too
    exit                    back to root
Your task: become `alice` and, as alice, create the file `/home/alice/note.txt` with any text in it.
Only alice must have created it — the box records who made a file, and that is what gets checked.
Where: on the box (`wg shell`).
Check yourself:  wg check      stuck?  wg hint
