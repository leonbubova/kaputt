source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/bash/bashlib.sh"
ws maxnum.sh <<'S'
#!/usr/bin/env bash
if [[ "$1" > "$2" ]]; then echo "$1"; else echo "$2"; fi
S
