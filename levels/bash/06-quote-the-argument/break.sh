source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/bash/bashlib.sh"
wf "my notes.txt" <<'F'
secret
F
ws catf.sh <<'S'
#!/usr/bin/env bash
cat $1
S
