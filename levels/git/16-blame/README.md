# who turned off the retries?
"Production workers give up on the first error. `worker.py` has `MAX_RETRIES = 0` and nobody admits to it. `git blame` points at someone who says he only moved code around." Repo: `~/.k8s-wargame/git/repo`.
Goal: write the author name (as in the commit) of the change that actually set `MAX_RETRIES` to 0 into `~/.k8s-wargame/git/answer`.
