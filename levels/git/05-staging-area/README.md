# the staging area: add is a separate step
Lesson: why two steps? `git add` does not save anything — it puts the file on a list called the staging
area: "these go into the next snapshot". `git commit` saves exactly that list, nothing else. So you can
change five files and commit only two. `git status` shows the three states with headings:
    Changes to be committed      staged — on the list (green)
    Changes not staged           modified, not on the list (red)
    Untracked files              new, git has never saved them (red)
Try it:
    cd ~/.k8s-wargame/git/repo
    git status           only hello.txt exists, nothing to do yet
Your task: create a new file `second.txt` with any text in it (`echo second file > second.txt`) and put it
on the list with `git add second.txt` — and stop there, do NOT commit. `git status` must show `second.txt`
under "Changes to be committed".
Work in `~/.k8s-wargame/git/repo` — first type `cd ~/.k8s-wargame/git/repo` (or `wg shell` drops you there).
Check yourself:  wg check      stuck?  wg hint
