source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
new_repo
wf README.md <<'F'
# shop-api
F
cm "Initial project"
wf models.py <<'F'
class User:
    pass
F
cm "Add user model"
wf login.py <<'F'
def login(user, pw):
    return user.check(pw)
F
cm "asdfasdf"
rec base "$(h HEAD^)"; rec tree "$(tree HEAD)"
