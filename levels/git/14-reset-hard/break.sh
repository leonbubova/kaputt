source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
new_repo
wf README.md <<'F'
# shop-api
F
cm "Initial project"
wf notes.md <<'F'
# Release notes 1.3
- search endpoint
F
cm "Start release notes"
wf notes.md <<'F'
# Release notes 1.3
- search endpoint
- configurable timeouts
- fixed login redirect
F
cm "Complete release notes"
rec tip "$(h HEAD)"; rec tree "$(tree HEAD)"
g reset -q --hard HEAD~2
