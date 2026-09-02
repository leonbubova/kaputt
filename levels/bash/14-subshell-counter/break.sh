source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/bash/bashlib.sh"
wf app.log <<'F'
INFO started
ERROR disk full
INFO retry
ERROR timeout
ERROR disk full
INFO done
F
ws count-matches.sh <<'S'
#!/usr/bin/env bash
count=0
grep "$2" "$1" | while read -r line; do
  count=$((count + 1))
done
echo "$count"
S
