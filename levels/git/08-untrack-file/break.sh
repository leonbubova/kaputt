source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
new_repo
wf README.md <<'F'
# shop-api
F
cm "Initial project"
wf tests.py <<'F'
def test_index():
    assert index() == "ok"
F
wf coverage.xml <<'F'
<coverage line-rate="0.92"/>
F
cm "Add tests"
rec base "$(h HEAD)"
