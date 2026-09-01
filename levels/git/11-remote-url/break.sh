source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
new_remote_repo
wf README.md <<'F'
# shop-api
F
cm "Initial project"
g push -q origin main 2>/dev/null
g remote set-url origin /srv/git/shop-api.git
wf healthz.py <<'F'
def healthz():
    return "ok", 200
F
cm "Add health endpoint"
rec tip "$(h HEAD)"
