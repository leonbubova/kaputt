#!/usr/bin/env bash
# usage: test/run-all.sh TRACK [NN]   — break → check must FAIL (fast) → solution → check must PASS
set -u; ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd); export WG_STATE=$(mktemp -d)
T=${1:?track}; export WG_TRACK=$T; source "$ROOT/levels/$T/solutions.sh"; WG="$ROOT/bin/wg"; res=()
r(){ res+=("$1"); echo "$1"; }
for d in "$ROOT"/levels/$T/[0-9]*; do n=$(basename "$d" | cut -c1-2); [ -n "${2:-}" ] && [ "$2" != "$n" ] && continue
  echo "=== $T/$(basename "$d")"
  $WG level "$((10#$n))" >/dev/null || { r "$n BREAK-FAILED"; continue; }
  if WG_FAST=1 $WG check >/dev/null 2>&1; then r "$n CHECK-PASSES-BEFORE-FIX"; continue; fi
  "s$n" >/dev/null 2>&1 || { r "$n SOLUTION-ERRORED"; continue; }
  if $WG check >/dev/null 2>&1; then r "$n ok"; else r "$n CHECK-FAILS-AFTER-FIX"; fi
done
printf '%s\n' "${res[@]}" | grep -vq ' ok$' && exit 1 || echo ALL GREEN
