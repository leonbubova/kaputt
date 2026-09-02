## 1
`git switch -c <name>` creates a branch and moves HEAD to it. `git branch` shows where you are.
## 2
Commit on the branch as usual (`git add`, `git commit`). Only that branch advances; main stays.
## 3
`git switch -c feature/greeting && echo 'def greet(): return "hi"' > greeting.py && git add greeting.py && git commit -m "Add greeting" && git switch main`.
