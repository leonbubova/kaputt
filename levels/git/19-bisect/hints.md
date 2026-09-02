## 1
Binary search over history: `git bisect start`, mark `git bisect bad` (HEAD) and `git bisect good <first commit>`.
## 2
At each step run `./test.sh`, then `git bisect good` or `git bisect bad`. ~5 steps for 20 commits. Or automate: `git bisect run ./test.sh`.
## 3
`git bisect start HEAD $(git rev-list --max-parents=0 HEAD) && git bisect run ./test.sh` prints "<hash> is the first bad commit". `git rev-parse <hash> > ~/.k8s-wargame/git/answer; git bisect reset`.
