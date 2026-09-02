# a secret ended up in the last commit
"`.env` with the Stripe key was committed together with `config.py`. Nothing pushed yet." Repo: `~/.k8s-wargame/git/repo`.
Goal: no commit in `main`'s history contains `.env`; `config.py` stays committed; the `.env` file stays on disk (untracked) — the dev still needs it locally. Still 2 commits.
