source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
new_repo
wf README.md <<'F'
# shop-api
F
cm "Initial project"
g checkout -q -b feature/billing
wf billing.py <<'F'
TAX = 0.19
def total(net):
    return net * (1 + TAX)
F
cm "Add billing total"
rec base "$(h HEAD^)"; rec blob "$(g rev-parse HEAD:billing.py)"
