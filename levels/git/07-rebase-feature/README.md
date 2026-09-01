# feature branch is behind main — maintainer wants linear history
"`feature/payments` was branched a while ago; `main` moved on. Policy: rebase, don't merge. PR must show only the 2 payment commits on top of current `main`." Repo: `~/.k8s-wargame/git/repo`.
Goal: `feature/payments` sits directly on top of `main`'s tip, 2 commits, no merge commits, contains both the payment code and main's README fix.
