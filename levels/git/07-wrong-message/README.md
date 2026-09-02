# commits are immutable; "editing" the last one means replacing it with --amend
Lesson: a commit id is a hash of its content, message, author and parent. Change one character and you get a different hash — a different commit. Git cannot edit in place; it builds a replacement and moves your branch pointer to it, leaving the old commit behind.
`git commit --amend` does exactly that for the newest commit: new message plus whatever is staged, same parent, and the branch swaps to the new commit.
The rule: amend only commits that nobody else has yet. Replacing a pushed commit gives teammates a history that no longer matches theirs.
    git log --oneline -3           the tip is the only commit amend touches
    git commit --amend -m "msg"    replace the tip with a new message
    git commit --amend --no-edit   replace the tip, keep the message
    git show --stat HEAD           what the tip contains, before and after
Try it first: `git log -1 --format='%H %s'`, then look at it again after any amend — the id changes, the parent does not.
Your task: "Someone committed `login.py` to `shop-api` with the message `asdfasdf`. Review is blocked." Repo: `~/.k8s-wargame/git/repo`. Stage nothing — only the message should change.
Goal: the last commit says `Add login endpoint` — same content, same parent, nothing else changes.
Check yourself:  wg check      stuck?  wg hint
