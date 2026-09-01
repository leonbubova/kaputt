source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
new_remote_repo
wf README.md <<'F'
# shop-api
F
cm "Initial project"
wf app.py <<'F'
def index():
    return "ok"
F
cm "Add index route"
g push -q origin main 2>/dev/null
wf search.py <<'F'
def search(q):
    return [p for p in PRODUCTS if q in p.name]
F
cm "Add search endpoint"
rec base "$(h HEAD^)"; rec tree "$(tree HEAD)"
