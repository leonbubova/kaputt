# track: the shell from absolute zero — plain files under ~/.k8s-wargame/shell/sandbox, no infra. Bash 3.2 safe.
LEARN_LEVELS=14   # every level of this track teaches
source "$WG_ROOT/levels/shell/shelllib.sh"
track_start() {
  command -v bash >/dev/null || { echo "bash missing" >&2; return 1; }
  mkdir -p "$WORK"; echo "your sandbox: $WORK"
}
track_stop()  { rm -rf "$WGSHELL"; }
track_ready() { command -v bash >/dev/null; }
# empty the sandbox but keep the folder itself — a player standing inside it keeps a valid current folder
track_wipe()  { mkdir -p "$WORK"; find "$WORK" -mindepth 1 -delete 2>/dev/null || true; }
track_shell() { mkdir -p "$WORK"; cd "$WORK" && exec "${SHELL:-bash}"; }
