source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/bash/bashlib.sh"
wf data.txt <<'F'
alpha beta gamma
second line
F
ws firstword.sh <<'S'
#!/usr/bin/env bash
head -1 "$1" | awk '{print $1}'
S
