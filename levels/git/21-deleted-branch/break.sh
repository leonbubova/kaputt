source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/git/gitlib.sh"
new_repo
wf README.md <<'F'
# shop-api
F
cm "Initial project"
g checkout -q -b feature/export
wf export.py <<'F'
import csv
def export(rows, fh):
    csv.writer(fh).writerows(rows)
F
cm "Add CSV export"
wf test_export.py <<'F'
def test_export(tmp_path):
    export([[1, 2]], (tmp_path / "x.csv").open("w"))
F
cm "Test CSV export"
rec tip "$(h HEAD)"; rec tree "$(tree HEAD)"
g checkout -q main
g branch -q -D feature/export
