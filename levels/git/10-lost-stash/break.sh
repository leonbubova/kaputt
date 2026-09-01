source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
new_repo
wf draft.md <<'F'
# Handbook
F
cm "Start handbook"
wf draft.md <<'F'
# Handbook

## Chapter 1: Onboarding
Every new engineer pairs for the first two weeks and ships one small fix to production.
F
g stash -q
g stash drop -q
