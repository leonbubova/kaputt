# the staging area lets you commit some changes and leave others behind
Lesson: a commit does not contain "everything that changed" — it contains exactly what you staged. That is the whole reason the staging area exists: you edit five files, stage two, commit those, and the other three stay modified in your working tree, waiting for a later commit.
So `git add` is a selection tool, not a formality. Naming a file stages that file only. `git add .` and `git commit -a` stage everything at once — convenient, but they are how unfinished notes end up in a release.
`git status` shows the split in two blocks: "Changes to be committed" (staged, going in) and "Changes not staged" (modified, staying out). Read it before every commit.
    git status                     staged vs not-staged, in two blocks
    git add <file>                 stage this file only
    git diff                       unstaged changes (working tree vs staging)
    git diff --staged              what the next commit will contain
    git restore --staged <file>    un-stage, keep the edit on disk
Try it first: `git diff --staged` in the repo prints nothing — nothing is staged yet, even though two files are modified.
Your task: "Two files are modified in `~/.k8s-wargame/git/repo`: `app.py` (a finished fix) and `notes.md` (unfinished). Ship the fix now."
Goal: exactly one new commit containing only the `app.py` change; `notes.md` stays modified in the working tree, uncommitted.
Check yourself:  wg check      stuck?  wg hint
