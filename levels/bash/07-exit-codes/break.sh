source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/bash/bashlib.sh"
ws mystery.sh <<'S'
#!/usr/bin/env bash
echo "checking the thing..."
exit 4
S
