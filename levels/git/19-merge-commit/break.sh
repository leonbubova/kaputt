source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
new_repo
wf README.md <<'F'
# shop-api
F
cm "Initial project"
g checkout -q -b feature/i18n
wf i18n.py <<'F'
STRINGS = {"de": {"hello": "hallo"}, "en": {"hello": "hello"}}
def t(lang, key):
    return STRINGS[lang][key]
F
cm "Add translations"
g checkout -q main
wf hotfix.py <<'F'
def safe_div(a, b):
    return a / b if b else 0
F
cm "Guard division by zero"
rec main "$(h main)"; rec feat "$(h feature/i18n)"
