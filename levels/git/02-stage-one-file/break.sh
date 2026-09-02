source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
new_repo
wf app.py <<'F'
def index():
    return "ok"
F
wf notes.md <<'F'
# Notes
F
cm "Initial project"
rec base "$(h HEAD)"
wf app.py <<'F'
def index():
    return "ok", 200
F
wf notes.md <<'F'
# Notes
TODO write deployment steps (unfinished
F
