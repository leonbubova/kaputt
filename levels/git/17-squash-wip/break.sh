source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
new_repo
wf README.md <<'F'
# shop-api
F
cm "Initial project"
g checkout -q -b feature/avatar
wf avatar.py <<'F'
def avatar_url(user):
    return "/static/default.png"
F
cm "wip"
wf avatar.py <<'F'
def avatar_url(user):
    if user.avatar:
        return f"/media/{user.avatar}"
    return "/static/default.png"
F
cm "wip 2"
wf test_avatar.py <<'F'
def test_default():
    assert avatar_url(User()) == "/static/default.png"
F
cm "fix"
rec main "$(h main)"; rec tree "$(tree HEAD)"
