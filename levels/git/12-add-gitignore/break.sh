source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
new_repo
wf app.py <<'F'
def index():
    return "ok"
F
cm "Initial project"
wf debug.log <<'F'
2026-01-06 09:12:41 DEBUG request /
F
