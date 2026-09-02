source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/bash/bashlib.sh"
ws between.sh <<'S'
#!/usr/bin/env bash
if [[ "$1" > "$2" && "$1" < "$3" ]]; then echo yes; else echo no; fi
S
