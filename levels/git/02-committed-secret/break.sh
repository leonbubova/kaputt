source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
new_repo
wf README.md <<'F'
# shop-api
F
cm "Initial project"
wf config.py <<'F'
import os
STRIPE_KEY = os.environ["STRIPE_KEY"]
F
wf .env <<'F'
STRIPE_KEY=sk_live_51Hx9QWERTYUIOP
F
cm "Add config loader"
rec base "$(h HEAD^)"
