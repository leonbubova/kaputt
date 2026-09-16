source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
new_repo
wf README.md <<'F'
# shop-api
F
cm "Initial project"
g checkout -q -b feature/greeting
wf greeting.py <<'F'
def greet(name):
    return f"hi {name}"
F
cm "Add greeting"
rec feat "$(h HEAD)"
g checkout -q main
