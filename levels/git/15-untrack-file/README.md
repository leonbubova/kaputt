# coverage.xml is in the repo, it shouldn't be
"`coverage.xml` is a generated report and got committed with the tests. Take it out of version control — but leave the file on disk, the CI script reads it." Repo: `~/.k8s-wargame/git/repo`.
Goal: one new commit after which `coverage.xml` is no longer tracked; the file still exists in the working tree; `tests.py` stays committed.
