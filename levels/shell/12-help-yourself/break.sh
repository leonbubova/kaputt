source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/shell/shelllib.sh"
wf .secret-note.txt <<'F'
files whose names start with a dot are hidden from a plain ls
F
wf groceries.txt <<'F'
bread, butter, apples
F
wf reminder.txt <<'F'
call grandma on sunday
F
