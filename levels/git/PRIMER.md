# git — the commands you'll actually use
Never used git? Skip this list — levels 1–7 teach it step by step. It comes back any time with `wg help`.
  git status                 what changed, what's staged
  git log --oneline          history, one line per commit
  git add <file> / git commit -m "msg"     stage, then record
  git branch / git switch <name>           list / move between branches
  git switch -c <name>       create + switch
  git merge <branch>         bring a branch in
  git rebase <branch>        replay your commits on top of another
  git reflog                 EVERY place HEAD has been — your undo history
  git reset --hard <ref>     move the branch pointer (dangerous, reflog saves you)
  git stash / git stash pop  park changes / bring them back
  git diff <a> <b>           what changed between two points

Mental model: commits are immutable snapshots; branches are just pointers. Almost nothing is truly lost — `git reflog` finds it.
