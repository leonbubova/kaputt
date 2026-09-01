source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
new_repo
wf README.md <<'F'
# shop-api
Run with `make serve`.
F
cm "Initial project"
g checkout -q -b feature/payments
wf payments.py <<'F'
def charge(card, amount):
    return gateway.charge(card, amount)
F
cm "Add payment charge"
wf test_payments.py <<'F'
def test_charge():
    assert charge("4242", 10).ok
F
cm "Test payment charge"
g checkout -q main
wf README.md <<'F'
# shop-api
Run with `make run`.
F
cm "Fix run command in README"
rec main "$(h main)"
g checkout -q feature/payments
