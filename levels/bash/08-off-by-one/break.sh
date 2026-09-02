source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/bash/bashlib.sh"
ws countdown.sh <<'S'
#!/usr/bin/env bash
i=$1
while [ "$i" -gt 1 ]; do echo "$i"; i=$((i - 1)); done
S
