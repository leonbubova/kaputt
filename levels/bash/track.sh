# track: bash scripting sandbox — plain files under ~/.k8s-wargame/bash, no infra. Bash 3.2 safe.
source "$WG_ROOT/levels/bash/bashlib.sh"
track_start() {
  command -v bash >/dev/null || { echo "bash missing" >&2; return 1; }
  echo "using $(bash --version | head -1)"; mkdir -p "$WORK"
}
track_stop()  { rm -rf "$WGBASH"; }
track_ready() { command -v bash >/dev/null; }
track_wipe()  { rm -rf "$WORK"; mkdir -p "$WORK"; }
track_shell() { mkdir -p "$WORK"; cd "$WORK" && exec "${SHELL:-bash}"; }

track_workdir() { echo "$HOME/.k8s-wargame/bash/app"; }
