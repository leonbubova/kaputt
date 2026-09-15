Fold the arguments into a running total.
    total=0; for n in "$@"; do total=$((total+n)); done; echo "$total"
