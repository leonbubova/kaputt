source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
new_repo
wf client.py <<'F'
import requests
def fetch(url):
    return requests.get(url, timeout=5)
F
cm "Add http client"
g tag v1.0
wf README.md <<'F'
# shop-api
F
cm "Add README"
g checkout -q v1.0 2>/dev/null
wf client.py <<'F'
import requests
def fetch(url):
    return requests.get(url, timeout=30)
F
cm "Increase client timeout"
rec fix "$(h HEAD)"; rec tree "$(tree HEAD)"
