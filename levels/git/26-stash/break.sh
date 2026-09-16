source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
new_repo
wf VERSION <<'F'
1.4.0
F
cm "Initial project"
g checkout -q -b feature/report
wf report.py <<'F'
def report(rows):
    return len(rows)
F
cm "Start monthly report"
rec main "$(h main)"; rec feat "$(h feature/report)"
wf report.py <<'F'
def report(rows):
    # WIP: group by month
    total = len(rows)
    return total
F
