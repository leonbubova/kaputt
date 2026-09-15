source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
new_repo
wf config.yaml <<'F'
app: shop
retries: 3
timeout: 10
F
cm "Add config"
g checkout -q -b feature/timeouts
wf config.yaml <<'F'
app: shop
retries: 3
timeout: 30
F
cm "Raise request timeout"
g checkout -q main
wf config.yaml <<'F'
app: shop
retries: 5
timeout: 10
F
cm "Raise retries"
rec main "$(h main)"; rec feat "$(h feature/timeouts)"
g merge feature/timeouts >/dev/null 2>&1 || true
