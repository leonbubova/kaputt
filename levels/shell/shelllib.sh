# helpers for the shell track — a plain-file sandbox for absolute beginners, no infra. Bash 3.2 (macOS) safe.
WGSHELL=${WG_SHELL_DIR:-$HOME/.k8s-wargame/shell}
WORK="$WGSHELL/sandbox"
ok()   { printf '\033[32m✔ %s\033[0m\n' "$*"; }
fail() { printf '\033[31m✘ %s\033[0m\n' "$*"; exit 1; }
info() { printf '\033[2m  %s\033[0m\n' "$*"; }

# write a plain (non-executable) file: wf RELPATH  (content on stdin)
wf() { mkdir -p "$WORK/$(dirname "$1")"; cat > "$WORK/$1"; chmod -x "$WORK/$1"; }
# make an empty folder: wd RELPATH
wd() { mkdir -p "$WORK/$1"; }
have() { [ -f "$WORK/$1" ]; }
# collapse surrounding/internal whitespace to single spaces
squash() { echo $1; }
# file content, lowercased, without spaces/newlines/trailing dots — for one-word answers
word_in() { tr -d ' \t\r\n.' < "$WORK/$1" | tr 'A-Z' 'a-z'; }
