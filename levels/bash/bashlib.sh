# helpers for the bash track — a plain-file sandbox, no infra. Bash 3.2 (macOS) safe.
WGBASH=${WG_BASH_DIR:-$HOME/.k8s-wargame/bash}
WORK="$WGBASH/work"
ok()   { printf '\033[32m✔ %s\033[0m\n' "$*"; }
fail() { printf '\033[31m✘ %s\033[0m\n' "$*"; exit 1; }
info() { printf '\033[2m  %s\033[0m\n' "$*"; }

# write a plain data file: wf RELPATH  (content on stdin)
wf() { mkdir -p "$WORK/$(dirname "$1")"; cat > "$WORK/$1"; }
# write an executable script: ws RELPATH (content on stdin)
ws() { mkdir -p "$WORK/$(dirname "$1")"; cat > "$WORK/$1"; chmod +x "$WORK/$1"; }
have() { [ -f "$WORK/$1" ]; }

# run a script from the sandbox: run SCRIPT [args…]
# prints the script's stdout; its exit code is recorded and read back with run_code.
RUN_CODE_FILE="${TMPDIR:-/tmp}/wg-bash-code.$$"
run() { local s=$1; shift; local rc; ( cd "$WORK" && bash "$s" "$@" ); rc=$?; echo "$rc" > "$RUN_CODE_FILE"; return $rc; }
run_code() { cat "$RUN_CODE_FILE" 2>/dev/null || echo 1; }
# collapse surrounding/again internal whitespace to single spaces (for single-token numeric output)
trim() { echo $1; }
