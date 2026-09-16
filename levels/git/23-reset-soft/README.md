# committed too early — take the commit back, keep the work
"I committed `billing.py` to `feature/billing` before the tax formula was reviewed. Undo that commit, but keep the change staged so I can commit it again after review." Repo: `~/.k8s-wargame/git/repo`.
Goal: `feature/billing` points at the commit before; `billing.py` is in the index (staged, unchanged content); nothing committed.
