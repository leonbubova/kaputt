source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
new_repo; rm -rf "$ORIGIN"; git init -q --bare -b main "$ORIGIN"
wf README.md <<'F'
# shop-api
F
cm "Initial project"
wf app.py <<'F'
def index():
    return "ok"
F
cm "Add index route"
rec tip "$(h HEAD)"
