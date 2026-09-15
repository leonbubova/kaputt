source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
new_repo
wf parser.py <<'F'
def parse(data):
    return data.strip().split(",")
F
wf VERSION <<'F'
1.2.0
F
cm "Initial project"
g checkout -q -b release/1.2
wf parser.py <<'F'
def parse(data):
    if data is None:
        return []
    return data.strip().split(",")
F
cm "Fix null check in parser"
wf VERSION <<'F'
1.2.1
F
cm "Bump version to 1.2.1"
g checkout -q main
wf docs.md <<'F'
# Parser
`parse()` splits CSV lines.
F
cm "Add parser docs"
rec main "$(h main)"; rec rel "$(h release/1.2)"
