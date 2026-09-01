# track: plain local git — no network, no daemon. Play area: ~/.k8s-wargame/git
WGGIT=${WG_GIT_DIR:-$HOME/.k8s-wargame/git}
track_start() {
  command -v git >/dev/null || { echo "git missing — install it (brew install git / apt install git)" >&2; return 1; }
  echo "using $(git --version)"; mkdir -p "$WGGIT"
}
track_stop()  { rm -rf "$WGGIT"; }
track_ready() { command -v git >/dev/null; }
track_wipe()  { rm -rf "$WGGIT"; mkdir -p "$WGGIT"; }
track_shell() { mkdir -p "$WGGIT/repo"; cd "$WGGIT/repo" && exec "${SHELL:-bash}"; }
