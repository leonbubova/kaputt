# the parser fix is only on the release branch
"`release/1.2` got a hotfix for the null crash in `parser.py`. `main` still has the bug. We only want the fix — NOT the version bump that's also on the release branch." Repo: `~/.k8s-wargame/git/repo`.
Goal: `main` has the parser fix as one additional commit, `VERSION` on main is unchanged, `release/1.2` untouched, no merge commit.
