source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
rm -rf "$REPO"; mkdir -p "$REPO"; : > "$EXPECT"
wf README.md <<'F'
# shop-api
F
wf app.py <<'F'
def index():
    return "ok"
F
